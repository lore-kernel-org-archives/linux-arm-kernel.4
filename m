Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED306606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a7aVkajl;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FzNfmaaQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iYkTywuCbwXoYuRkafCkrkQZYRRKfQoT9USNJ2YT4e8=; b=a7aVkajlN8k9ngDvR/4oVJntrK
	Ff1OnVAm1Z625ifvD3Uefhb5m6uWEJCGbesmyvhDGOxcPOzfZv5p4EYakk6/AE+v4jcwNSBHQbfrZ
	sD8eeLcdun9ul74WfgePwHdnEPnPcAX1vQC+VGiLDxec+7Np6jJWXLPTBJBmEfSNIL2B+H5j2aC57
	H4lvIsv/W1L3XS9vz60IuNkGi8k31C7qJda4Moaet+pRrNa34RAywYCq4RDxSgQ9Jq2/OzKwYAjaO
	wZOIbSEzMWL6EVMzNan77urKVwW9etVlp7Txvf9Fyw7XTWyEwNGMB4rbI8oXG4ILC4UfSTdn2xHZK
	pr5nZLCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRxe-00000001A58-1jFI;
	Mon, 09 Nov 2026 16:11:10 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRxa-00000001A4m-0w4V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:11:08 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-490d59c3edaso821174f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 08:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794240663; x=1794845463; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iYkTywuCbwXoYuRkafCkrkQZYRRKfQoT9USNJ2YT4e8=;
        b=FzNfmaaQFJeE6q29grhjMGG5elvdOAkGjhabXHH8TDvjDrgxK8Vjj14GuLh770K7bZ
         VqOxaBJedKkKAeKg6IwIBz3IgP7ZSqARjNWeWJbRpMMWxmtt/XfXSnXUhKzn4hYbF0td
         A+C5UgIExhpMvx+TXeIIa1jUrIAbhbOznWSHpSQJblLx9TN3J2mpDiCLtd/NKzcn+p4N
         rKPNXIu7lsFAVQYqZ8hidKbhhqJhkAe/IipM04mUc/cqk7Yi1zDoVfjq32ZrsRYzEZqe
         Y8nDcEjc2pML0jCdpytqTRbwvwGE5kOVzPsNCyqeC6ezCezrIVhb8e5pFP5Df6dWOT1Y
         ceDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240663; x=1794845463;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iYkTywuCbwXoYuRkafCkrkQZYRRKfQoT9USNJ2YT4e8=;
        b=i1GP3iTgynWWb9/3oDnzvH2PuPvmbHxiRWS3+ABg/6fAnl3+2J1Xr6/OsOOrOu3SZY
         S/gxYzY8CcEkn+k5ciKyua1hZ/SOMm0QOQwWqTEfhBZITOr5MRpDSf3CjokgoHAzDy5c
         ThC8xmNafaqwwAQQ+cfZOIyQayGTRRFsfXrRphBLMAZLYfRXSY5lHSeC5JblwE+GRbxM
         mcTw2DrEU+9kOKwOUHhuMMNYPK0KDPp5gCf/3UL/sk/YNEXUmFUNdSOZMryMDBh3g7m+
         MTiBfBV2gkMtIdSF7+Xjwdtbnw2wzz+8tkskRra4W3ih7Q7X8TPaU4TnyLIXDKN6CuBw
         0LGA==
X-Forwarded-Encrypted: i=1; AL+hErEKesjQ87hWmINR5utihhqlxEssJWmpd5+dlXwMAnIsszGZMuyPJvPU0PSGhBP0bl6jNEXjSm7KqLdYTjNBlORf@lists.infradead.org
X-Gm-Message-State: APuU4Z/9KvvLQDUmzfHlgUmQTj/hqATXAkFpipzHVoXM1kUqZfXjAKvf
	TUMPutlj56DX5FJwAIpo4VoTBOWGlyvluusfCoEwg2YBW0ca+Zvz/71xayKb3veDe3I=
X-Gm-Gg: AYBFou3mzLXqvIcsWgixLe4OvEFpAi/ZeYDdbseH3r9BnrBMW+fav9nS5LImPZjTNxW
	80LwakK6YkmOL97U3mITQbEi2ZytnpClBlTh1BdZysKzOwdT0AkgVIuBwTn5OhqJHq8Bk2QC2VA
	HAdqokSxv9VGYrtTXrznnStORGzXF5wffmAwRdjE/254Ib21U4zf5eQIBaYqrswdHzticWvdCMq
	5XjSM178IjdYZ5ZsNAk8Lo3Us8KFuq8WTjTQWlRPoBIGobkCoxO4XIZ8rZcg/q7E0+ZO/EU2ygH
	RYpQJAd7NP8YP3wHoXs5HpUdYVXuhPjmJ09Ii4PwYDKrPnUJTNLFjdiBeHcdEpZ+CWrD041qjWh
	0ArmLzhj+ENNqeAFjvyYBfV6dqZLIrl6rnecER+dSi9cJjHCBHjslx3y/kcp5HibKzonho5akQ/
	JZ2G1+cK5fNKekj8LRAyXDc9cS0rAWwOsjB1xwpqfaH7q3ha0ykGDH/yyy96h+TCxXWkdxR4pxi
	covDNqf0XCzgq5qIue+sz2CQ5LU6vx62/OnnPGAy3aPEyxtSMIfHIFP5YCBFp6lwUPP5e2+zSua
	x6D/49VmcrSMNR8mg6C4gYB/YZjM/lVGWrwFzltaNme1ieDm4mTp4KBQF1YdOFyKT9U6Rnq+r0Y
	gVW67eWYdiJH3SW9AEGbZU848k3jn1gE15Np0
X-Received: by 2002:a5d:6f0f:0:b0:488:8347:a110 with SMTP id ffacd0b85a97d-4958852d7camr9206350f8f.7.1794240663350;
        Mon, 09 Nov 2026 08:11:03 -0800 (PST)
Received: from localhost (p200300f65f19a90407b2ef73b14b6bb2.dip0.t-ipconnect.de. [2003:f6:5f19:a904:7b2:ef73:b14b:6bb2])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49592f38e2bsm11333582f8f.8.2026.11.09.08.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:11:02 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto/arm64: sm4 - Drop cpu feature table for PMULL
Date: Mon,  9 Nov 2026 17:10:52 +0100
Message-ID: <20261109161052.890682-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1632; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=ZENMDpTv1RAuYxRP4uIpom+hTDPJIPTBuLnJMesEc/w=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqyPH3raN9femBcj1ypSsHWevt2/r3ta3Ba+ElrePbFr9 ZfH0+t+dTIaszAwcjHIiimy2DeuybSqkovsXPvvMswgViaQKQxcnAIwkZnG7P/M1Wauzlf5nie7 6gL/tADeqtlPhFQ8Hz2psdyrLPSr6YTa9wWeCX5VCrV/suftmv4/4UtYkOrV1GwpL+v8Rj/2Bsn SY3dkwubrJ1/RP/A/P/5FeH6B673185nbdP43z0+7uefc24lXzyZsL+L9f8Zx/XQZL0+/ePWwu9 krlLZN8+dmUBNYHHqquL3Ha83GbtNoH4UlK27JlJnxJMXJym809JjOzaAT09rVNSXryunF6U7XC la7XOMoO9i3e1cHv/ixt2V/PuT33lrhWloRIWe6wX25zVTncw2PfyikRUvss2q/FCffqvlIoCHd 8aB3kLSi3Z8XbtHO0zKMGSTmLIiUaXBcNX/eBOa9ItvjAQ==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_081107_246821_9A0FECD9 
X-CRM114-Status: GOOD (  14.54  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The result of having that table is that the sm4-ce-gcm module is
autoloaded if the CPU supports the PMULL cpu feature. However that
module is only usefull if there are both SM4 and PMULL. The module is
already auto-loaded if the CPU has SM4 and calls sm4_ce_gcm_init() then
which fails without PMULL.

So dropping the PMULL cpu feature table has the only affect that on
machines with PMULL but without SM4 the useless module isn't loaded any
more.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

PSA: I don't know what these cpu features are and what the sm4-ce-gcm
module does. I just stumbled over that MODULE_DEVICE_TABLE(cpu, ...) and
convinced myself by looking at the code about the above analysis. It
wouldn't be a big surprise to me if I missed something relevant. So
please apply some distrust before the patch.

Best regards
Uwe

 arch/arm64/crypto/sm4-ce-gcm-glue.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/crypto/sm4-ce-gcm-glue.c b/arch/arm64/crypto/sm4-ce-gcm-glue.c
index ef06f4f768a1..ffed81b40220 100644
--- a/arch/arm64/crypto/sm4-ce-gcm-glue.c
+++ b/arch/arm64/crypto/sm4-ce-gcm-glue.c
@@ -247,12 +247,6 @@ static void __exit sm4_ce_gcm_exit(void)
 	crypto_unregister_aead(&sm4_gcm_alg);
 }
 
-static const struct cpu_feature __maybe_unused sm4_ce_gcm_cpu_feature[] = {
-	{ cpu_feature(PMULL) },
-	{}
-};
-MODULE_DEVICE_TABLE(cpu, sm4_ce_gcm_cpu_feature);
-
 module_cpu_feature_match(SM4, sm4_ce_gcm_init);
 module_exit(sm4_ce_gcm_exit);
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.rc1


