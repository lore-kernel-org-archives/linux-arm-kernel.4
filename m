Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE25C606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FYkXBS9y;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+xfZVAB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UpOmPB0SAKmtOrTDDvYOJ9QlsXaXjLyVnjun1DyFN3I=; b=FYkXBS9yrtEaV/
	M7+5EoAss1WL+M5zhsd9OMzN26JLy2eQIaA4RJPcn+k3GmoF792oXrJepcUuJQMf0PdFjMXwhFox0
	Ic4vQpEaO9XVGc3F78Whe0BMClfRoPToxAnRA3YxTeGjuYhpEUawszLGR4t35+nJOeaknNujBnlH2
	vXg76Eq0762DzPBdvWypMWEPpgkNANWroohjM2DOyvLkIhgY9GwKmI4uH7DYCurYzaRxdZPg/Ed/L
	avuHVaafX66jrkxNkpLt/gP0FkVGL7Fz89LUZFR7ioAKbUlmp+ol95V9v+Yj5ju/yM7hN1PCOoXuc
	29GTavW+GPgGm+LL6QDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVV7l-00000003kvP-1dgc;
	Mon, 23 Nov 2026 14:34:29 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVV7j-00000003kus-0oPw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:34:28 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-386ab9ab619so2381354eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795444466; x=1796049266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UpOmPB0SAKmtOrTDDvYOJ9QlsXaXjLyVnjun1DyFN3I=;
        b=g+xfZVABDQHBpzqZ47P8Ywd4u1aOGhXLponhomQAU2HZ3/6MwyLZZT4ZL7qXMwyhKW
         zDPK0Muer5hngKsrZ8oQ6FItSR/tFAmX6B3v6H3vxjMN6A030/VEVaQmcJoOmoJQ9gJW
         CU31TEQsix9Bnk4eGHUIASzxyExZwV/k4ywQWEDANWEPkz2sXgmaiWuR2m5+8y+BbHyB
         fNjA9I3c3xUYvtwBU4pzAvDucjXDGAj7P4ufiWLmRKDxWpUZO+5dZvBJYb5UUWcReDUJ
         leMzN9THH6bXONBzaQnVVudKH1lvmMyuP+iDPO5Md3eMXvPZKyiKOu7s6tQL37C6pxnM
         H5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444466; x=1796049266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UpOmPB0SAKmtOrTDDvYOJ9QlsXaXjLyVnjun1DyFN3I=;
        b=HyNVIacbBYmL34cxW2bE5VaXhPeW0EvrM2wRWCsvwh/NtptnWc+2r4A/eb21T+Z2/W
         VsV3zEL/sYqrW9lezktJi66r6TCva4K82vH3O4vEkFcmQNv2aFa2i+6r5UwJBIEHvnEV
         qetsZoPco8JVCSeuzVq1MbseIylThUmaB5VQCaxWQMX/nKVU08t1hYIXPMQWdkXGkXoH
         Gfo6Hr2N/3FF7IxUrxlOCWqLsECTrM71rfrD9H+sTFoLHZtV6yoOUUpH6EFLFP4AozCO
         1/BXEOlaB2VCUdz/o6AGdaBjW8mEO3sJ4ghkAnQLy6De0hZJQs7le+iL/SL2auXKbEGT
         +Fkw==
X-Forwarded-Encrypted: i=1; AL+hErHrZapEUwbVMbccEKBjsJvKDvlqjmDyPyaz98d6YDn/k2dpHzUzTOIyy4gvpd1st8qNQ/WY8OX7SnbAB3mEsTuN@lists.infradead.org
X-Gm-Message-State: APuU4Z8YoYXyE0VoXXgyTugaVpfEvSBLpAHbn6tm5XT4Jo0Un4QVjmhD
	4moXkte5vvMW5ct4vPsp3S9gbDpNH7qs/sHOkQ+Zksnn/gyVUn6UyAnj
X-Gm-Gg: AZFdTZfz0erR0OHUjFQ2Fv5/gij4fLS7Qbc1rFNnOmn5jlceACaFtYaOKGmVCjEtlNl
	/5sCUFywGs+FCl1mik/YfhlAw2q4EznoFn5SgrrAePth0CBBE1Hk7v5EsYeMiOMT4jT2FIgxTBj
	rKVF4WB1wkrpBxQ1nWCaVIGMYk2pXi82GesLq0AvaK0i90/mBDBZgM/5a3N64feGs06UI3tRDdq
	kUpR6QewT5orykwOfGdi7IKMzU8iHGju8WO83epoxNDBRVrWCQvEGT0t3jIGcgjavdJo+dauByS
	oue6DWDOWsTsopBpoKSl1NJkvpmVi9V35e+Oc7dNcpfZo4hjLXPRKI8d6hI9hqodYzVeo2C4FQx
	E/yeM6rFR+vS7S3OL44Jq66E+/YWHz/b7FHlk+zE8atUFrXWKbfNbJwhLdf+cAlRxHABKeqWuYx
	9qhUJsMZC15sCt3F1U6W3eiiAUKW6Z7NpWrRJtOvxJtPk1EwzduxpEz5PxkpI92aPwLSbyvspos
	HiYD+PBhDzxAtEhUElf2ItrgtiLMArjmcSqz6ofYRVNgvIbc0ThsUFY1ARi4KKnqyWoFFy4SDJz
	22xcjWa77A0XuGASL7DoqD5nAMIeS+Ri5r+aet14ul29XQavS0Y3hSD3c3kwj6QWrUORz05qFx6
	TwOYpPRaBJcWD9aLsG//+2g==
X-Received: by 2002:a05:7300:50c4:b0:386:121c:c275 with SMTP id 5a478bee46e88-386121cc3c8mr11003857eec.10.1795444466105;
        Mon, 23 Nov 2026 06:34:26 -0800 (PST)
Received: from acemagic-m1 ([2401:7400:c804:b668:a7dc:f03c:3f60:caaf])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm3197652eec.9.2026.11.23.06.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:34:25 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Anand Gore <anand.gore@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Scott Branden <sbranden@broadcom.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: arm: cpus: Require cpu-release-addr on bca-smp secondaries
Date: Mon, 23 Nov 2026 22:34:17 +0800
Message-ID: <20261123142203.3860616-2-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123142203.3860616-1-hjf3108@gmail.com>
References: <20261123142203.3860616-1-hjf3108@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_063427_347979_022FE223 
X-CRM114-Status: GOOD (  11.28  )
X-Spam-Score: -1.9 (-)
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

On BCMBCA SoCs with more than two cores, CFE parks all secondary CPUs
on the same mailbox. Extend the brcm,bca-smp schema requirement so
cpu-release-addr is required on all secondary CPUs, not just CPU1.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index b83c7785f6..0b7dbc75ae 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -492,15 +492,15 @@ allOf:
           $ref: /schemas/types.yaml#/definitions/uint32
           description:
             Physical address of the 32-bit MMIO mailbox read by CFE after
-            a wakeup interrupt. Required on CPU1, which CFE leaves in
-            a holding pen. The kernel writes the ARM-state entry address
+            a wakeup interrupt. Required on secondary CPUs, which CFE leaves
+            in a holding pen. The kernel writes the ARM-state entry address
             before sending the interrupt. CPU0 is already running.
       if:
         properties:
           reg:
             items:
               - items:
-                  - const: 1
+                  - minimum: 1
       then:
         required:
           - cpu-release-addr
-- 
2.53.0


