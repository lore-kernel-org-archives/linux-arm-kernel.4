Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BEE606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2vvkcWap;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EWRWKGYC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XKcu1hf8/1vowb9+McXQ7a9vqHCfgDABTmuu0dmdG04=; b=2vvkcWapP87+Xx
	RAvNRufSAU3KVg5sFiyCzTtskvWaMopymZR3R6E0y5IppRxwzjT9pXlDqjbjqtRGBqt5mZaGoD30F
	GoKqdUipYivV29SjABGs4NqQQexmQvyjF9vCrHGN271NnGffham4v8+vM5MWE5t2eW8zdCqZsa8Y+
	ajuDkM2QERFCQ1euXHThOrYeRu8jH5OCQU2CKsA3ugrZjf5I4PyM+Kc2CyJieu8t4tQUvlH9OSP7q
	3OFKgpmnMxZj8GhTeAqjkD5veCK3VX7OivQTdmKTWlKCCFwbG9iD+qQTzXfqTUupbvubuvKXAZ8Ug
	8Zrxs9e+YdBDasYRyqEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8Hs-000000093e0-2K1s;
	Wed, 25 Nov 2026 08:23:32 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8Hi-000000093Y4-2dHm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:23:23 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso11760591eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 00:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795595001; x=1796199801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKcu1hf8/1vowb9+McXQ7a9vqHCfgDABTmuu0dmdG04=;
        b=EWRWKGYCTcXAINI9NNt0/jvmkrZ3D4MpFI6IRVJOuoQ/lAo6V76mCRDT4AZTYQyeVd
         WpumKFKTYbOJ3rZLbSw60mV/5roPq7LrMIl2ybUlUM5oz2M0Twgfj3/GowQvd3+RpvQQ
         ZrsYNSm5fSD5T4rqdRHJVY8k2eBCgqtWzdMdkkTnajwqmLTk460LkS0NRMhtAMCQ5WcS
         HFPAMHAc7pOpWhGWgRQ+3HUo2FotJtM6CICu5PCkG9AW/ZYRgD7mr2zzjrBpdr+95LoV
         Rz4O9jEVXYiXGDIpZPape94oRSZPveI4x46SiQIpykS3KGcEPkklnkZrQmbgSJJJghhT
         O/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595002; x=1796199802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XKcu1hf8/1vowb9+McXQ7a9vqHCfgDABTmuu0dmdG04=;
        b=iSHIMtbLa84iNzdjxAjJTqW8wA1UAyotgbO4B71w9Z+FQvkLzkB5tF7XMZUE5z4BE4
         +4xbCC6NEt9/a1yyQuQIErh6cH27NyQ3kBUpGovtCySqqiiXFjYXm9rgR/CF4xc4G5oj
         gMnaTu/DoLJ9/Nk/wcvLJRTiypj+TDdF7qcEM9Iws0mAhXAuC6yCoZYhyuDPAsVT/7pt
         MSsFk5Cae1G2WiuaoVcAvTdR79EKjp/Mh9fd/PmlubFmIFE9xFp7smB0eHLfXEC2X+/7
         GtU9rtL9ExIevPV7QRMo9GOZilabmHc5Nr3DaxFjO/1zsfkNm2liZQaqCiqqQctVE/OO
         kq+A==
X-Forwarded-Encrypted: i=1; AL+hErEWwfmACmGx0Mkp9odI9n9MlCoFOBSHwEin3r1LpJn3sokRfmHtxRL1I6S48FNKFRekW8mKOCvTjtkq+FcJ6hu3@lists.infradead.org
X-Gm-Message-State: APuU4Z+eb+9JnhSl3ksI2PlPmy1oepSzpcR3jEPPBeZHTeZc0abG7cPv
	NTo2iFbDV/w9Zc5ER6JBNypaFptGKIsiBRP0XZo50hPux7jDz9lcGX36
X-Gm-Gg: AZFdTZf97wKEJyys1JsVmcyiXI5+WitPeZtlTOCe49mI37nUBupFz90w1n6bGy+2sCY
	U6oV7kxXXD6/38OJJJHZrvsJj0Id8PmRqTKhKujRu89IXxex/cwmPAlp36VU65vfVvTFe962gzZ
	6hJDfBAEfzAAgOg1tK1ANB7T96/liqFI3dz4Sof5TDaWxsBwE7qeVEIDjIh4hEnzR+kYmJZabHw
	OipG/qvG8YnC4WCQyWS7V26CYjM/U76fo2FMo3M0IPJe/0bUm6mrvkcAgLbJ4eU4NnCrcbYBQD3
	cZE/vK9UOx6keFs6s5ihU9i3T+/9+z//ArMWF5NJ5yW7SNgxM9WTygwnbtsS/2j1K6Yo7ZJIt/z
	4LoqjB5pcH9aw115zFlLQAHV1Hi4AcEGFIRQCbBdU7Gi7zzgWJT9r5dqe36b9xnlyx5G97YIchd
	k1fdj9ZfVxXblriFT2Ukr1fnafwh7e/WhrnArauQnQpPy0EjjTVhexoIv/angIzlJH0itVGa0mi
	X+sMeHfyavkdV/ZM0ZCG4OY/XGlb77JXzTAZK/0H/oktZB9QZmgz9BWijgQICdaByW2OUSYCAZd
	Hrp0V9lqlls9mszpYWgz1ZJxxKw4y6NjgS8QuagehMrvs/DZqI/PwLevmLEY7x+YoPoizJfL
X-Received: by 2002:a05:7300:cf1e:b0:36c:b138:651e with SMTP id 5a478bee46e88-3857093fd1cmr21332699eec.22.1795595001427;
        Wed, 25 Nov 2026 00:23:21 -0800 (PST)
Received: from adlinkccoe2-Dell-G15-5511.adlinktech.com ([183.82.204.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm50919906eec.23.2026.11.25.00.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:23:21 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
Date: Wed, 25 Nov 2026 13:52:21 +0530
Message-Id: <20261125082222.136238-3-dineshkumarv85@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125082222.136238-1-dineshkumarv85@gmail.com>
References: <20261125082222.136238-1-dineshkumarv85@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_002322_687879_9A7B3692 
X-CRM114-Status: UNSURE (   8.30  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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


