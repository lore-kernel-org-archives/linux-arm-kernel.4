Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E009606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bb892Q7E;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVy/ergG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9P9bZiuQb+3bgepIV3kTLbZdzWdKynmmECPlKobX7T4=; b=bb892Q7EGV1pXY
	LyhdE1J8w26T1YA9lsYuM7UXpKEdJXU8j3pX6/Ci6m57i6ffMo4YXEwtbcAbuzaKIVLBuPQf/sY21
	nDUhw8N9D6Nc5clW4VCsOoeJl5D0prDTu3m+9X5WFuiWM10WPLXS1d1UfKhN9c6MlitnPalz/LKP6
	oQIMwi1yro+qmZiG7JFTHO8L1FPvSqWeHd2mtptscAxyNQnqjKxuV+QJb379Uexe0fPyasBhZa52U
	1NuvimswDhI/eYzH/HI7MN81sG+5MNS8/C1Dfg2r139tgAYkD1YKOWMA0jmKSufmTxVs2lp597KEv
	FeeMWFseGe1LU1NDeOvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbvi-0000000DqCk-3Ofu;
	Thu, 26 Nov 2026 16:02:38 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbvY-0000000Dq7E-1JIc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:02:29 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-33fb4680717so2871868eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 08:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708947; x=1796313747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9P9bZiuQb+3bgepIV3kTLbZdzWdKynmmECPlKobX7T4=;
        b=fVy/ergGrtk5eEgpzOFNQZl/l9zOoIZ2Bt8l8hphtrv9Sx82N1SNt7iunaVJROTQOk
         YLxGeNzgHChchJmhF5H3FEoIeU277gauRSCC9neU3GnSG2EfjXeJjJn3E7GiHaHCP9tv
         iQW8jMRFs2aTJULPjNSNpPQblik3Sn27zGiX2etDw4ecIHHWEUQseXA5s4w1lxIvtQth
         eeGhH4pdonKRb05+/oFq/dDrJn7tv4LcG8BJT+FAP8uuww3v9aexwwGsH4lSZRMhqF/y
         SsV4EOTJUDMdo0fSlYwyXT2hOKLGEgw0eTayrsLjbyizIMYCD9NhSjqnp4sJ4Ss8Zxgc
         r9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708947; x=1796313747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9P9bZiuQb+3bgepIV3kTLbZdzWdKynmmECPlKobX7T4=;
        b=Ejm7bRM5Evwt4SxkhiWCo31xRpdTPlTNlBJY9mQwcldRgbkIN4ha/367CYiryjMhEZ
         7frya61y4GLS9dhlwR9LcAs0ITSnnbLWS8De+8QhA6QN8M0BoFlN2gkGYGwbe5cOrcC+
         QIOO8zYo6/6Ol1RKHPJWRTLELPXzJkmVQ5v1BceXgulGHpKeVorCEa4wQrHxZhg1U0NE
         OooG6Bqs+cJDxNjLJKwPUW+cC6CRCEwNYUXH2eh59ohs8FtVf1T5RyDOOx6LM5DTglaG
         DnSf+Iqk79tah+WiAU9ZFetCIP+lMX11YmYAHhDzJoB3zOE3kOjCHmY6BCtkZ+FjElsa
         zt1Q==
X-Forwarded-Encrypted: i=1; AL+hErFatg+pMjg1HLsA+6dddjCSWohkEjUz91/fVg1aIVFQnSNQzgjpnMJWxdKg8cDtf2NdOdSVppl6FEmB4OrmvVKw@lists.infradead.org
X-Gm-Message-State: APuU4Z/LVdp3rS4rWH4bNUwe6X6tqtPIzrskfr2c/N/Uqfr/vKx3sAgm
	j4FVsTdP//hUX7V869TdJ6IpeAy1l6BfF/WhMalj12YNVhma1KCMD2jl
X-Gm-Gg: AZFdTZfT+cSXrsOrmtmKxlHdjenwM35CpFYoV3GbgeDIWz+qdG1ZprD2dS7s0iGloQ7
	L4o+UVS3yTayGCKh4zFfuZfe4AES701cV7Eg83oKy2lG+oqNPnlqzymcvpVqnru6+Auy5jZ4dQr
	/+sq5G5Jsl00OGtcyzRvl/K3twvAU8q3eQJ270a6OI9OgqsG/YBSlKufBOaexdmsmvWZf1ccJi9
	yvy66hDohFur7+l5RSL3A3tAqCKxrxty7UWn5Y/tXLK9SFfCCLwTsEEz7SzN4tumiqPlPpxksqO
	tHkUvo89zGGGGMYRugb6VQuO/HGupFnqZRm2tn+m/LypbfMpDcylVjVGST06gVtot9pu/GorLYe
	o/U7LzxP20uSKDWHm8mU+xJNWEKoN7zvdcGukCljd7o/Hl1NZreieC7Jr0PYqcrL+GEMLSpjG4P
	lJL6Gjroeh/jWXOB/vd6GVYT2JuRXa10SCti8zZO9ywOLjGsndF+EjJFe2XVfCB+RjJHhiMBvZO
	5PTQvpb0IGybVB8v2auURKR9t0OAld5GZttnolu7OqIeYc73dlQz7zSreQrKx+Jv4w3o/pS/40L
	nOMJPcwt/6E4meoMhOHW1ak2a/iCdIQ5W5B7Ux2hzOma
X-Received: by 2002:a05:7301:a23:b0:386:9ad5:6641 with SMTP id 5a478bee46e88-3869ad56b0emr18511297eec.32.1795708947325;
        Thu, 26 Nov 2026 08:02:27 -0800 (PST)
Received: from localhost.localdomain ([183.82.206.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm80062260eec.11.2026.11.26.08.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:02:26 -0800 (PST)
From: dineshkumarv85@gmail.com
X-Google-Original-From: dinesh.v@adlinktech.com
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk@kernel.org,
	conor.dooley@microchip.com,
	s.hauer@pengutronix.de
Cc: daniel.baluta@nxp.com,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v5 2/3] dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
Date: Thu, 26 Nov 2026 21:31:01 +0530
Message-Id: <20261126160102.52163-3-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126160102.52163-1-dinesh.v@adlinktech.com>
References: <20261126160102.52163-1-dinesh.v@adlinktech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_080228_352234_2DD45049 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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

From: Dinesh kumar v <dineshkumarv85@gmail.com>

Document the ADLINK LEC-iMX95 board compatibles.

Signed-off-by: Dinesh kumar v <dineshkumarv85@gmail.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index cb99fb74805b..baa96b004c52 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1577,6 +1577,12 @@ properties:
               - fsl,imx952-frdm           # i.MX952 FRDM Board
           - const: fsl,imx952
 
+      - description: ADLINK LEC-iMX95 based Boards
+        items:
+          - const: adlink,lec-imx95-ipi-smarc
+          - const: adlink,lec-imx95
+          - const: fsl,imx95
+
       - description: PHYTEC i.MX 95 FPSC based Boards
         items:
           - enum:
-- 
2.25.1


