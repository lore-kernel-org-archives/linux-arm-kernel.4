Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6658606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 23:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wy7z5unN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MI4cb6m3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Bbz8LNU5azQdFUh5fnUImloX5/acT18ctarlFycpFR0=; b=wy7z5unNaKFrzapJT+thAwteng
	cyN0hFWCnGr2U8Mj34B5e52FgAUFzbvutZNv+MEpjoE+M7z8ze3sAoqHNEmjdpNiDWLMjh3BQmrY6
	naabCwv1yPB8ebG/jUA61MzjvPi4wFio2QLPR+9Berv4ILE36zds3Uox828i1EVkccHBhlw0nZs1q
	j8KrR+pviTg1UzZ5iytJ3jNJrvATQ7pq3g2f9DhRcGhtNJo32fMzZjsTm73/tQIZ6kAPD48V7cEl4
	JGfowKM9oiJs5nCTNAEWbLtiYtNx69qPV8Ok9PoweJXK0h0vk7K4YdBaKvnK+GsMmFnfcS+GLOG8Y
	aw8kz8Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWivv-0000000Efet-2yfI;
	Thu, 26 Nov 2026 23:31:19 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWivt-0000000Efe5-0T1p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 23:31:18 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2f04fab527eso56817755ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 15:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795735876; x=1796340676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bbz8LNU5azQdFUh5fnUImloX5/acT18ctarlFycpFR0=;
        b=MI4cb6m3sov+pZFd0/swIMaHkZbP+hgeqzzmImBXKgjxeOCKjE+jxNFnEnlVsXTm/3
         L1qiING3Vy9wES85+deSjMQ8xVoPwyy9jEAN4/b7bJIJmINwtdFEsRedVPOQXn90lPL/
         nQAoD016HDHohnP2CUm+fvksg/AjBde2CcQMYvVJu8WYbCYYLvnajPuTMoYPJWDmzpUP
         1NQmHQyGvs1DNTeKheSWCdCBYbwIbw/BMt63nR0cdLfH7ca92oKw61C1PfpgPPD2J2bQ
         /8CoakPxJK0L0PjjrvA6Ib8LxwYr1Xd/eJDFT4hQ/gElj340FVzLD4vrQ0PuUssdLy/q
         Ww0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795735876; x=1796340676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bbz8LNU5azQdFUh5fnUImloX5/acT18ctarlFycpFR0=;
        b=BZN01pEOoLs+Ua9aahBhmNflK5lUeOozcd02TNIJ9N2NviDbz4muTddheYHWV+8dGc
         svwBuWnOXUQKacbDb5zk/HnsP9EkYQwMF5cp/vIWSr1clVMWTm61STueLGs1VPafOqlh
         ZnFLoluMjY95/Qsq0oJz9MYyjDBxpAwZPmtJPZ5MJvyq6TpwSvyOFLBVRMKlcYaMf4ea
         gsKKMw7Vf4xdb0LO94bPUFeQIasfXyCazfB80UQYxXfjhstYNMuDAc0K16Ue1Pr4KjUz
         xpMZCfcc4wZt/fGsVBsF8pW1Z1oI64RQ4R3S82BNM9zmMeF9T9GU95QPQUycClCqwJxh
         Kzvg==
X-Forwarded-Encrypted: i=1; AL+hErHI9rjd3TjSruzu1Vh1nm+XeJ/cWqYk+wRd1bedD4/uEI4sUF7a5LIgOZiVeEM3n4v582FyqbBZGXlOKp/+mKJY@lists.infradead.org
X-Gm-Message-State: APuU4Z9mGG9u9l3DMgLn+VRN94dTfHsTogo4D3gzPnyKP+Ghcb6Pq6yi
	2MJPx0bsAhAa4SOYtkgYrotysN8Z7c6QpoKkGwTC+H47okScq2YxoLEM
X-Gm-Gg: AZFdTZf+RvCCVqIVSs0qH+kCwf6Ml61GmnQAmBB4cEyLzbUTj3rdxZownchF5coUP2G
	x9k4XHWcWzDBUcuTv1xa78lEtfh/LKFPaRunyS8y3P3IBo8De42wKv7cUYflLzf7kDo6lNrhUa8
	ZPE7Lpbt3CgFTcmXV8//8Ew12C2aHorgkjJoIdOuB/qRQ6gcTw6pWlcfFHA45byEohc6K5aMsZn
	GGsxSIAUxqvlBgLE1Gc11njfW00y0lqPJ/huNBc00kl3+sn8Vr1qwc/r78+m/IMX6oS1QeGQE5d
	oKdnG8qA/gCI9EaffsLApqzFObvUh+orqZEE6P1OYYXWNna5jIl/hxHXq80d9LWuH3xPVuUwTWU
	sWxF8BBOEP+7jW6ce48lUFxWc4nwVoOfj1djSCyUm9+/SRLoYb7giDrbtBKi9+RRL7N0e7Y0ViC
	nf2BZUR3UxLtMOz4rSYKIGn1+SiEnpTCijRuoSZ8eL49BEHx0ENrvZDx/E9ooUOeE0YlGkyzuNI
	lh2oL45lKmGZHJlnHmS6LoL8ay3lhxpluMrkZu9co9qG82VcvVjOCWb5ZIvY9NB1SoD2S5GtU2L
	FT4GesGIKpyfUYk8Nsx2G0jxBYuanCSamtDM/QJxIsNtdkxzjA==
X-Received: by 2002:a17:902:db11:b0:2ef:eb06:387 with SMTP id d9443c01a7336-2f03f246dc5mr238581485ad.47.1795735876217;
        Thu, 26 Nov 2026 15:31:16 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c42b1sm108793055ad.17.2026.11.26.15.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 15:31:15 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] KVM: arm64: remove trailing whitespace in reset path
Date: Thu, 26 Nov 2026 17:31:12 -0600
Message-ID: <20261126233112.71504-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_153117_212462_C79843F4 
X-CRM114-Status: GOOD (  11.77  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace the tab line in kvm/reset.c with an empty
line to keep the source formatting clean.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm64/kvm/reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 10eb7249aa9e..6116c9ad054c 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -108,7 +108,7 @@ static int kvm_vcpu_finalize_sve(struct kvm_vcpu *vcpu)
 		kfree(buf);
 		return ret;
 	}
-	
+
 	vcpu->arch.sve_state = buf;
 	vcpu_set_flag(vcpu, VCPU_SVE_FINALIZED);
 	return 0;
-- 
2.56.1


