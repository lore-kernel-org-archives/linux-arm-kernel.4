Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CB8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NJBBGtHF;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GubjcS3W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OoIcQaiQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CQNCc886Hmd2ERLzq4jw1PUvCGY+4w5fk+7KZKnHLwk=; b=NJBBGtHFespJYtRoZCyt4NH3Cb
	CVoDLDf1MpgdevOPiy0AgXwmYBjMfe+oPsS9siFahvRAd6zCzmR26SaGqf8VBNeI/7sVQHnHY47LD
	br0yUUZz+dF4fOYA5d6Dzy/4otdjW+cMP/j5PV6v5MqQgczMSEBl3d8gDRXBMpMOdfCUfeOdlkkIF
	eOIl94a5OpwOWwzy36y7U9THk/82xLqJpbr963dqmLPquE6iQ59+lFUg721ifGVfX9iB1HMAG6bnD
	QHDgGGja3bbIiOLsgOFcdrVvhCLLuk+xJc8/qPxmkrtjO/SxzxrYRpLXAkjzDv8xLufMfWCip+liu
	PTcV3rnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTItI-00000005pEe-2tZR;
	Tue, 17 Nov 2026 13:06:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTItE-00000005pCO-07Wl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:06:27 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0i2x1457229
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 13:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CQNCc886Hmd2ERLzq4jw1PUvCGY+4w5fk+7
	KZKnHLwk=; b=GubjcS3WWE//GTAtNVooXD6Dfo7xWxMD0xQSB3+z4b/XkFtE2Vf
	E5oEAbrcgvPs6Hg2rFUlGD60XPEVEPezlRL5Go1CnsIKU1IQu1oBqb9gbtRWB26y
	/rmZOsQew60thQTNvoPXehcYgbmq2Ufxh7M1hs9LjHvrkRT21sVSdmBLv6YSLAIY
	w4JgPgVwvDwSkZXL/g75UBPuJDh5mbUl2jKnxBpHXpRoUsPE3JuSVsVR0XL552vf
	UEnIg2N7dWfx/FyMMkZauIDFsAjANGjP87iNJM4+M2RPvNmiREP5hvoKZv6G6fAl
	C3l5emmzK/xAYe4hSaQelPUoxAceqpcUfYg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0nc80j64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 13:06:22 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2ec691518so706185137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 05:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920782; x=1795525582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQNCc886Hmd2ERLzq4jw1PUvCGY+4w5fk+7KZKnHLwk=;
        b=OoIcQaiQdEIjAMgH/TSzi8QOroHI1O1bwsUXqbD40IdprTlsz3udzp+M3n5T4NOOEC
         dnfoSFgwoBV0MNEv17PyU7quMZrV9MY0NUbDJ3DEEm0cRMSNqbT2FzYzb+nvuC/w0ClI
         rCGBzCmVh+RPwNVndc+Cfi6BqB/X+vaJToHilC4nmK/t0HkNtEaD5riSUc4iHIcrYqFY
         iRE73XErY8sagH0izxlwUiYpUZdxa2Axc+lUlnHeMkg2AzvXLjmzVZ+4Q45TEaSRHQGh
         hCnstNxwph3TCnWmlfuYYwhYvBr3EJn7VN6GeWzTjAGCaGFFaxbV+t4+TNTz+Sdk1sGQ
         dfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920782; x=1795525582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQNCc886Hmd2ERLzq4jw1PUvCGY+4w5fk+7KZKnHLwk=;
        b=f7Prvv/enjmgSKVgizdFKgaiXS1iwAERtj8SP0FNh/tD6ZM+GPDdFMvOWtZ31j739P
         oKWFE/BvvpfoMbx9JqTrM3WTSo4rz9SUWf0Bj00QB5g+6iCfY4vzWHOXVAuiXna0Nt+S
         vszMre1gtM4jcmnm1TQsPgi3+hhxMGFfMqmIa4XDuJPnUGOJ6iOVvQyMqX8PZeEQkQ3q
         8Vca50v+uV+PYwI0M1pmkXNJFMpdiBJxQ0l6L1VgKnieyPU4QcxD24Q40ncDcNWnyFdk
         nBMGI+kMz5AtEDzcHoVwn37IOACznC5FTeXSKPGDUtr+SF6DXAmACCdqE6sRWQtpqK8i
         iumQ==
X-Forwarded-Encrypted: i=1; AL+hErGnvfyz/fViidCbGYKFWoZzZwIo7/sbn9yS+eXQRoV8A9pwBRJ3uaqg4ZNoull6fhzOlnyvWiqSwWnW88L2qTLh@lists.infradead.org
X-Gm-Message-State: APuU4Z9/As/wrtHMiccowai5KcEt04C2PGSdR+GWHa0hxLnK26zkbTBy
	Zs5dO6E2wY/A48tyfwC2EXfYpdW1XC1xi20Wv0xrdnGMpIO3v3cesg0fB4Adiuoxzw3FN603b+f
	MRjU84lF6VP4qvHpH5+sS95dAe5PN5I0V/nPgnlxMirpqdpCD5ZFBE18g+bQUbzgh5ziJyz7KjG
	E7xg==
X-Gm-Gg: AYBFou3RJRmNtVDBbiPwGWDfRX02XSp7AAKtB7QX8BZjI3mN1MZkmgkqSmW/BG0lRfl
	VIr76OSPqPJYNQFMCVosW8JRbbUNfZieAReUu0EFCu/8ME6I7sXfCO292Z8MWl6MMC2dGPIqt+1
	dSTs8nqcWLabisqai2TsHd8cIB9oFcpvmEHTiUD07r1VUvnh0ZfZD3glNrFW6gWeZBFhRaUpsr9
	1UN57VLsBs+5vh84h1FTAMuGOWIrpRltxAM7351OG1hH0vkP2KaRgmDYdb+nLztnq+tz/iMi++T
	Ceyt828pgVVKvjSd692bLrSHyNrd6ptpTwIWtURNe4SoI75oRZptthzH6udoBoTdMbOI/LDtRcT
	/uiEToJG2mWewq3KC4dxOf/XHjwC51AyDahN5puB+dVAmmUYlt0/h5K/u4G2UzQ==
X-Received: by 2002:a05:6102:2920:b0:7d2:fdb9:b189 with SMTP id ada2fe7eead31-7d69f850c5emr659918137.34.1794920781655;
        Tue, 17 Nov 2026 05:06:21 -0800 (PST)
X-Received: by 2002:a05:6102:2920:b0:7d2:fdb9:b189 with SMTP id ada2fe7eead31-7d69f850c5emr659906137.34.1794920781161;
        Tue, 17 Nov 2026 05:06:21 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm5835117a12.9.2026.11.17.05.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:06:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: apple: Remove undocumented, unapproved aliases
Date: Tue, 17 Nov 2026 14:06:17 +0100
Message-ID: <20261117130616.234953-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5232; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=clfI8+19pJhAA+hV4S1Z6XrUeG5urAAHKTU1TXEfHlo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/FFJYgi+OqbMxgoQ89jlVKosb2EARn5KZIaER
 f9mvb0IWpyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxRSQAKCRDBN2bmhouD
 15HhD/9oH1BS9LqVZQUmtukQ4pBKCTUnveLA8banunKm54eECmroM6X+THHC/UIfkgTIp9t3WUn
 FSAhCkt01Vr+dQbCnSu8lY0JPjnuMK2wOaKZZZPHzbmUchlIfqpOjq4pwoom4AkX4Es+RmEXl+j
 3LJQNF3/DGw6d+YsEHxGCl0WNBqqCrIdTR5USi8kFXSbmIh8uFOo8iSvTcpZEXHhsw4o/m29O6g
 5fyalqopdTAJslaGkcPPy9E3NeMmGWWz52a+CAvcw+p111gRGN1W+j9JWpsEiJ09ukzCofT+zQ+
 5b4BmJXEOPUs2GkA1d5TTbF6w96/IsN0DNRdqHHOTj8EztnF+k2+Jvx4GFFruuDI9nCvIh0snBD
 x9PQTybp61IT07uCgumlUt4Hjfsl86eagESaE5Jo6xdDPPG38hvO4f60NY2r/sbayH6VETvYHD9
 Iz+2mdtArDeIRmNrl3G7LtqmzAj8T9IZ1yJq8r9zPsHiD5zemQ5gPtSBOK+k/7Z3qtjpmJiMJC3
 IGSdHVCHvrBRzXMFBS+bmH3TXODB+w588WrxwZ0Nr+3RMdUyb8lkWdsnwm6swZutHZsdrHl1+0A
 OtNrIpUmuNoRSr0v7+QrE+J+kaaXEV01l7HPe+6ltJVVgj/OfTs2Tfw1F3DcQNEtxEbl8i9dG/k 34eoEYM979TDAuw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LaipeTfi c=1 sm=1 tr=0 ts=6afc514e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Zz3YpKYli0cBJYq3SAkA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfX+Yo2MD6hf3Iq
 V/sulVeYE/my/tvT8d3Rtts6Hwv4E6OibXNaZUOn1G+OGnUFDxoHY8jekJnm2pE1lxDkarUT2ec
 nMzAhnPtrICv/ysOxXAX8xZI9ZfjnX4=
X-Proofpoint-GUID: r71kmmNT6Ydr-HOChw_IUpAlhp9Yw_ZT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfX7/5xNJ5yO1iz
 xDHIucDGvlD4VeHpL6jvY6dVDXosD/bA+EOnbD5yJxEUU1Z1n/tdiSyfAkxVLc7DcEb4Y0TxNHJ
 I+9d+dYz6fqlyz3EAIx+6DxFzbkNkewTKUt0hLuO3VKZOUbwNPeW403S3IHlpUEtcz+WcYTLFcX
 wXtMAvzcHH5aiZKiY/FSjVrnl8muhEro0CGyAsAquTu4ewtESYajobdrWnm5CySbiA1FM892ubT
 fIz8HPAkiU0eJOqOwMOikFVDc6XE4q0EgBn+L8EbuEkAfEIjEKDq/4i/IzwWRbqvQKSWUFFclmc
 JsUBuE62ylnV2B+mvJIYXxeRJrX9tu9ebm28gblNmPqSWVGpoVjYK743EadQ6PoZT2LnUCwD5NY
 wdHJeR6EktaaIVQ3D0efELhokRXvUaE6taq4KNaqXB1znY99sMzT1XbSxWX+pWTXFyvwNVv5fgl
 olvp9uniWBTG0z2fQKw==
X-Proofpoint-ORIG-GUID: r71kmmNT6Ydr-HOChw_IUpAlhp9Yw_ZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_050624_076970_165768A5 
X-CRM114-Status: GOOD (  16.59  )
X-Spam-Score: -2.8 (--)
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

The atcphy and touchbar aliases were never approved by Devicetree
maintainers, because they were never documented as actual ABI.  Drop
them, because no new custom aliases are allowed for years now.

This might break users of this undocumented ABI, so these should be
updated to use only documented and approved ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/apple/t6002-j375d.dts      | 4 ----
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 4 ----
 arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 4 ----
 arch/arm64/boot/dts/apple/t6022-j180d.dts      | 8 --------
 arch/arm64/boot/dts/apple/t6022-j475d.dts      | 4 ----
 arch/arm64/boot/dts/apple/t8103-j293.dts       | 8 --------
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi      | 2 --
 arch/arm64/boot/dts/apple/t8112-j493.dts       | 1 -
 arch/arm64/boot/dts/apple/t8112-jxxx.dtsi      | 2 --
 9 files changed, 37 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index e6eb6b6c386d..9f0476e1ae2f 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -15,10 +15,6 @@
 / {
 	compatible = "apple,j375d", "apple,t6002", "apple,arm-platform";
 	model = "Apple Mac Studio (M1 Ultra, 2022)";
-	aliases {
-		atcphy4 = &atcphy0_die1;
-		atcphy5 = &atcphy1_die1;
-	};
 };
 
 /* USB Type C */
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index caded1636f3d..1a745c6593fa 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -15,10 +15,6 @@ / {
 	chassis-type = "laptop";
 
 	aliases {
-		atcphy0 = &atcphy0;
-		atcphy1 = &atcphy1;
-		atcphy2 = &atcphy2;
-		atcphy3 = &atcphy3;
 		bluetooth0 = &bluetooth0;
 		serial0 = &serial0;
 		wifi0 = &wifi0;
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index 8a1494949e4c..3540edc56b0d 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -13,10 +13,6 @@ / {
 	chassis-type = "desktop";
 
 	aliases {
-		atcphy0 = &atcphy0;
-		atcphy1 = &atcphy1;
-		atcphy2 = &atcphy2;
-		atcphy3 = &atcphy3;
 		bluetooth0 = &bluetooth0;
 		ethernet0 = &ethernet0;
 		serial0 = &serial0;
diff --git a/arch/arm64/boot/dts/apple/t6022-j180d.dts b/arch/arm64/boot/dts/apple/t6022-j180d.dts
index f76b887429dd..0b1f1bc46270 100644
--- a/arch/arm64/boot/dts/apple/t6022-j180d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j180d.dts
@@ -18,14 +18,6 @@ / {
 	chassis-type = "server";
 
 	aliases {
-		atcphy0 = &atcphy0;
-		atcphy1 = &atcphy1;
-		atcphy2 = &atcphy2;
-		atcphy3 = &atcphy3;
-		atcphy4 = &atcphy0_die1;
-		atcphy5 = &atcphy1_die1;
-		atcphy6 = &atcphy2_die1;
-		atcphy7 = &atcphy3_die1;
 		nvram = &nvram;
 		serial0 = &serial0;
 	};
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 32938a3bf96a..4fc9a42160ea 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -17,10 +17,6 @@ / {
 	compatible = "apple,j475d", "apple,t6022", "apple,arm-platform";
 	model = "Apple Mac Studio (M2 Ultra, 2023)";
 
-	aliases {
-		atcphy4 = &atcphy0_die1;
-		atcphy5 = &atcphy1_die1;
-	};
 };
 
 &framebuffer0 {
diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 1d074b9e6018..779da65a66e3 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -18,14 +18,6 @@ / {
 	model = "Apple MacBook Pro (13-inch, M1, 2020)";
 	chassis-type = "laptop";
 
-	/*
-	 * All of those are used by the bootloader to pass calibration
-	 * blobs and other device-specific properties
-	 */
-	aliases {
-		touchbar0 = &touchbar0;
-	};
-
 	led-controller {
 		compatible = "pwm-leds";
 		led-0 {
diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 686fb1dd215d..5304a5591984 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -15,8 +15,6 @@ aliases {
 		serial0 = &serial0;
 		serial2 = &serial2;
 		wifi0 = &wifi0;
-		atcphy0 = &atcphy0;
-		atcphy1 = &atcphy1;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594810..b0c93788c72a 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -24,7 +24,6 @@ / {
 	 */
 	aliases {
 		bluetooth0 = &bluetooth0;
-		touchbar0 = &touchbar0;
 		wifi0 = &wifi0;
 	};
 
diff --git a/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
index 562e7a25a1e8..31d8d2aaf30b 100644
--- a/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
@@ -11,8 +11,6 @@
 
 / {
 	aliases {
-		atcphy0 = &atcphy0;
-		atcphy1 = &atcphy1;
 		serial0 = &serial0;
 		serial2 = &serial2;
 	};
-- 
2.53.0


