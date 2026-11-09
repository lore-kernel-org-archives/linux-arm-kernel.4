Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B60606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nmUyBdwM;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hLRqKbg0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FpiqRag+t5NMeuB2lpRlUMa7TgFo9C0tjAPeji60Tuw=; b=nmUyBdwMwIlN3DNctulGk8Ah7w
	fDCYG0t/f0I6+sNo/yzn/eIf4RgN/2xrqarB4ihl/CRYGnewPnYvIJ26X97rJLmNznVGdi3bbbcLn
	i8dsYBbB8AMe8yCMyCrqxJjgB31JZiQ7W6PgPZonNom0OfFEyvXJyOuu1ncCwIAdubWRbRllqd4+q
	JIhVmQYCsIRXwBgd/qsgAtDWZNLzXptDeEKST57TcjCxfhj40cgYJHSaVVZx6Nc1E7TavJX5JsSIr
	+sDFGELZdEizZ2cEVWfXMOK5Yc6g2hjGz9yTjKv00QlJXD8Mn1G+u2Gr3pk0Q0JHRHIaBQWDdPjSW
	yYOo68Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSUf-00000001DwL-15HB;
	Mon, 09 Nov 2026 16:45:17 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSUa-00000001Dvo-0tvJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:45:16 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a210470b49so8452655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 08:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794242710; x=1794847510; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpiqRag+t5NMeuB2lpRlUMa7TgFo9C0tjAPeji60Tuw=;
        b=hLRqKbg00lLNbBG/l0DWPg9GEhgPuqhCrHQMOuN5WTIoPd/6YNpUr/t4AdOjnjj6vh
         p4ZZl3XFnqCFpgGSKgr4AEQ9nTA1eHygED0JccZcrhiQ1sAWKA+hO7EE7nw33eGcK8eP
         t+4yVXFLiqAcOsJouvTZknV/OiSElZgB6xgQU83slmbaL+D2SSEX9fzHaGo7uByjtlUn
         94NmV1PNypnIG23hgG0+jfAfkfveO7rbXvV1uiv6QwKIWfl+Df9n4+XHzDIJKPaay9OJ
         kuFJNUB2T0VYSuVBy0gjYIBok3emo7XV8Lj+0z9jjXfeOEI5fiBqrs+kzNVPX1HUoC5F
         sHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242710; x=1794847510;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FpiqRag+t5NMeuB2lpRlUMa7TgFo9C0tjAPeji60Tuw=;
        b=XwJu7Ceu/Mh636vNjZ7RKkiSLLkmoDQtYJFgD87/2Tr5AJhECifMYv9FpFUIKlXGbx
         DgRynSLd9qRHEnbTlQR7MVJh2pgXIVnTa62iMROtycez+ftG7mJZnbtgj07P+nkwrJXq
         Nd6SRUXhFiRmpx8t0Z01u7bg4YgjPnXf8I1cW4EA8LCm7rga1Jter3HfxehUv98PAUPE
         0dg0Ric6HbsBzSiNschfzlmMYzIN1fdPciRY6vvnmwmY40pYbexO6IYFxZjbrLTPQUAb
         PRa/OhGtupV0g4tU9vY9x/NhcyY60mf2GkHt0ntGvzb04LDr2GFSYp3af59GYR5p3kS1
         e5pg==
X-Forwarded-Encrypted: i=1; AL+hErGqn3EcQdI1V3euN9XPALjlhIEmiyy9+oJxjJumYKC/fPG3xMLhetqm38LXvSxOIytcufaCszabEADTWwt4bjZz@lists.infradead.org
X-Gm-Message-State: APuU4Z/nk4pdPfTmstukDW6BedsIVQxUwhTMV6Nvo4t8Wxkei01KZu2n
	fG9fHTWPUQnMY7/rI/t53dCCL96vqGl90ea/WUwcOG5nuRvkKzQ5Weu8sWyZouRSlFsH4WumTNf
	2JOD1dmM=
X-Gm-Gg: AYBFou2vmWcfMpI7vFTuCz0aFKUP/lH9sl2B88COqA1MbeQZYQItA6E8901HrO+0/Rk
	R/FYVqHc3GsjAwYr2hf2li1RiKpJq1RTaL0dL7tbg34CCtJlYIbwU/xHNKg/uNdHTlkowCF7R6l
	eplILqQOV1G38x9pTtc2it/dJpQZvAE3Wz/va7EyFK2BxWh5Xh1iG3Ps94TIDL+3+ICx3NaPUJ2
	9IzQLP8hsh187Q5Oasx0T/AYgcqXy/buhuJMGCtMwX3GI7LYcDtC+ZOl0KYUdNaJY5mzAz6sfG5
	H0daIW1qzf1WjqUAUEHzM+ZoCYLI0u/BVDe/JH4gNPgjygwnmJCAVt/t9xgHf7n121lrgRB8++N
	uHOXaDz1NLilxt+YidDeBHUE7KPUBAdt+Tj+I4ZvDSgEkEoAROXjY26lCVnQOS1x4S/fFXBAqM6
	aF/M/BstZqmuJ8m0JHaB/06x6piqeVBGwfqisKlifAxNJ8TyMzYSzXjUgBT63zwcCcCtie1MEPJ
	Eshn8ZSfuyDUk1YfOajLyXszvHpPm9/iubP5qQdCK8f6e5VR+kD5uqvp4di9R452qm4cSPY/tKi
	5NVAzw1epj5UIO159D+S+TXZDipC5jV3Q4MOj8qkwd+jgMBVDjljWXpVwQCIjca8lQrf+hSGqeW
	KAWnLxxJIRBvxikM=
X-Received: by 2002:a05:600c:524e:b0:4a2:a9:ed5a with SMTP id 5b1f17b1804b1-4b960d9bb10mr93175615e9.8.1794242710297;
        Mon, 09 Nov 2026 08:45:10 -0800 (PST)
Received: from localhost (p200300f65f19a90407b2ef73b14b6bb2.dip0.t-ipconnect.de. [2003:f6:5f19:a904:7b2:ef73:b14b:6bb2])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01fd4754sm31615e9.14.2026.11.09.08.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:45:09 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] crypto: arm64/ghash - Reduce boilerplate
Date: Mon,  9 Nov 2026 17:45:02 +0100
Message-ID: <20261109164502.905237-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=lwNvkM6qvpzuHSc2uxsQlZKF+Oa7f9Zznr3rNlsBfkw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq8fiOhLsVtaX8XKYIBfS3FUGU/riART+vS/RBv A9nIr0wO2KJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavH4jgAKCRCPgPtYfRL+ TpTOB/4iYigJ1++vAX+4XjRUWiW7t8/QF1Sf4+OyChwtX9F3aj6GbFEfjaKvJm38H6aHRz2Aa7N Y6ZW6pauYylv9qcXXfvok/8pgyVl+xFLtFO/zTHoWX/YvVJY9/ZsTM5zlY/mMWEXN2+BAG77IW+ LKE6AiHwW7xzZptaXmmoMuXIXiNva/rA3DrBY2Dfg2qWz8ZRqZ/JtfvGsTtOLiMjivFNE2PjvZ8 mAUqistuSWJ8FGFy/G5fXhNbBJVHn75a5KxTwduap49quV9prrXGmfGeJ2dyqB6khpQXynj+vPD KTnm/FZqcM1j5iSX9zvSyyUc20Y+2SU9FFBmoWU4oa2y+Has
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_084514_236036_21A9E6EB 
X-CRM114-Status: GOOD (  13.21  )
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

Make use of module_cpu_feature_match() which expands to nearly the code
that is typed out.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 arch/arm64/crypto/ghash-ce-glue.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/crypto/ghash-ce-glue.c b/arch/arm64/crypto/ghash-ce-glue.c
index eaf2932ceaf5..0884f812a315 100644
--- a/arch/arm64/crypto/ghash-ce-glue.c
+++ b/arch/arm64/crypto/ghash-ce-glue.c
@@ -384,7 +384,8 @@ static struct aead_alg gcm_aes_algs[] = {{
 
 static int __init ghash_ce_mod_init(void)
 {
-	if (!cpu_have_named_feature(ASIMD) || !cpu_have_named_feature(PMULL))
+	/* ASIMD is implied by PMULL, but better be safe than sorry */
+	if (!cpu_have_named_feature(ASIMD))
 		return -ENODEV;
 
 	return crypto_register_aeads(gcm_aes_algs, ARRAY_SIZE(gcm_aes_algs));
@@ -395,10 +396,5 @@ static void __exit ghash_ce_mod_exit(void)
 	crypto_unregister_aeads(gcm_aes_algs, ARRAY_SIZE(gcm_aes_algs));
 }
 
-static const struct cpu_feature __maybe_unused ghash_cpu_feature[] = {
-	{ cpu_feature(PMULL) }, { }
-};
-MODULE_DEVICE_TABLE(cpu, ghash_cpu_feature);
-
-module_init(ghash_ce_mod_init);
+module_cpu_feature_match(PMULL, ghash_ce_mod_init);
 module_exit(ghash_ce_mod_exit);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.rc1


