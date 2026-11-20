Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E73606A6DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=quzjNdsB;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZGCQrKt4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kuDH04La
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=41CfvWilGEXnA95p4GfArJCQxJtfnNTP1owROe/U+kg=; b=quzjNdsB0TfcPw
	YMxNGoxEsvgCOaiBVP62xPp7z+8N1sYA+DNipewXzBwYN80gn5OFsqXfiKgsyopAEx5W4dsBU8tkz
	otQB4BuuDRL5T+ItYrP03VRGy3gI/N2XxUikYTI015ClGOEmLi2RSQ4V39AjonsOfrPuGiS1xS04c
	USkse455Bpy1rFqaYFkqDXx6kDHXXA4JfvtRuw1jIOLoeEdAZkoJx2N6tCLcKfdOp90A9rTyJsTU0
	OKJSE+7TMMINeAcOr9rW06lm6oJwDdiP93vYqj/0Uzc2QeU+tMDpcLP+l6A8QvFRajeLbNKLC8ANe
	ZDZrDXnWfCTDt8gzt2ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUOu-0000000G6he-0CMo;
	Fri, 20 Nov 2026 19:36:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUOA-0000000G6Ss-2PJo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:35:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKI9Vau3120579
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 19:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	41CfvWilGEXnA95p4GfArJCQxJtfnNTP1owROe/U+kg=; b=ZGCQrKt4/uDsOq/M
	Vh5HlJGRDrVRvRCUjnew32SQ+6unuKLVLWVCbzNU2vQPxZL9Wm5rppBZcTYj4kAw
	pWEA55PcMtn4a/YXSD795fEqNHeA7an3iPnHOnMRKn6bkGrHZZ84HKRc8Ym2Pgyi
	wzgdka2FkqmXSFmUghHJTdnSxWFHiFO/AnOiQUUAg0gZYASxiqcrAyZS11hr5UgQ
	J4uOMEPopbBPeobs+5kJU36PC8r11QztOI7yoQqgOQ0DE2O4fbLLBTeADN5frTl+
	uLMJGN/JenDwGsuAqLqynsvJgXKNnmq6lZDBNkmsrrAHWT1lD2z7qcBtB0sciOST
	hIH2VA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2u868ad6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 19:35:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d2bde4c78so20725051cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795203313; x=1795808113; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=41CfvWilGEXnA95p4GfArJCQxJtfnNTP1owROe/U+kg=;
        b=kuDH04Lan3oCsaTg/P2cF+OckyqZ2b/x0dwnSjXJQuraxtysOIAg5CbyZob0+JgZiH
         e4gASPZ09aeoPgHBEJ5oWo7VFJyGGxEiEVtMhYtV+8j7VwpeUdkYx3P/2EJwI3vIewTF
         /U8v9+O2CrXTuh/Im7EZFdRpGJhnFANMnvgPHggJEBUFAJJo9fNKT9jozHXYNWCx2/a4
         kaGG1SIJs4GzzviJ6SVxdPMeowadSOgWraM9/Xzyq+ZF3qLgISamAUxP2eu5OxolrCf/
         xUASBN5z1I9J2p6ow6McR4f7bPOrFrjTWd4yuhgeER1O3GlkjLa3uGnjq/lrHfB3gwmf
         LhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203313; x=1795808113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41CfvWilGEXnA95p4GfArJCQxJtfnNTP1owROe/U+kg=;
        b=lwVO9K7QVp85Saab32HkxOrL24V+0+1nyaWETehkbqi7AURc8YNrpgb450eij3mRu7
         7AwUNtX0DpItdg+ugTtuanN830V4QNA8R24kTvrYBfZgL49S1zApOJIOa4B92ZIblImq
         uCpoyPaxgSpRZsLXHCYVUZNRVv11mCi/1PSnrSafQx8c9v+d2JfAUIBacZv8dPwT/ppN
         jiZtQeLK2YPtAllUPcZ7nB3rBetB+HN6QgoSFBf8XO5PaJwwcIJBn5fU2pMABJUpGHu9
         8/Yso1GWW6ODbLqPFZzn0OMzmzwHUsFfut5FvDeOCTRx0vGSxXcGlP3o+5iH6ZNpYgHM
         yX4Q==
X-Forwarded-Encrypted: i=1; AL+hErFjiCSjpQGQeZ4ieu7bniD717iKp49rA72HyLDX7P0nfBXKp3T0cihhNJNvGXd8aj/FENaOaA9Y1OPh7de6qfh8@lists.infradead.org
X-Gm-Message-State: APuU4Z9HvshNBXXSg6GXbr5+QfN/PgjqQ0rfqCOew49RYD0Pi0WWB4H4
	4ly+h7qghy6mZSe1VLoD9v9ZmhnIlngjOpbOm0Ol8SsrO3GlVqI879n0uHVXxnQ9LjnNssLkJCE
	FkZz/shMpb+I9f7dDCK66SF2sCMiNHEBgDk7hYIrUOeZm6qJY/c7g87F+vt/uSXZvcpzr+2VZcP
	aFsg==
X-Gm-Gg: AYBFou1SE+Eo/TaDtGL9kpKgOVMmeWBWgcQpzp7+Q0TMehMklNB8WBk3WUDKV8KiMy3
	ZwkWMBzNb4e0POq8O7rpnrjzyjnKan47iPJIFwi2Gdffo1D29T9jVtF5K7s2o7HxGfVkjQYFSEv
	4cBKN8wol6TuWorBBRlpEQHILZ+IhmS4uVPcNos+UhGTUHxPzp8L4lfGhGBfUe27gGnZ8kHZzCi
	p9no7L94CeRN7h4Zo0Q/71pEiJ1Od47FTnjh8CfZIFV9QGJucB0lmpR77JPN+N9os+reFvknWlH
	u62iAKYeO5kaJis71nw3rCVsEvTl1ilY5uu/nleifIcgtX+JbEzex4NCd5mRGoTyTD3fd6tf/1M
	PSk3Viy75kPnU9jfRa3Pcfeii13cll/5ZLM7HNMg9JSdFXt2wdU9T8Ih6B0zK9uBZCG9jd8jeVg
	C0
X-Received: by 2002:a05:620a:1d0b:b0:949:75f1:e5fe with SMTP id af79cd13be357-949bab1719cmr629546085a.73.1795203312987;
        Fri, 20 Nov 2026 11:35:12 -0800 (PST)
X-Received: by 2002:a05:620a:1d0b:b0:949:75f1:e5fe with SMTP id af79cd13be357-949bab1719cmr629542985a.73.1795203312591;
        Fri, 20 Nov 2026 11:35:12 -0800 (PST)
Received: from brgl-qcom.local ([62.245.128.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm6806343f8f.20.2026.11.20.11.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:35:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 20:34:57 +0100
Subject: [PATCH v12 4/4] arm: multi_v7_defconfig: update the Qualcomm
 Crypto Engine entry
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-qce-fix-self-tests-v12-4-b5a2a44bc5ae@oss.qualcomm.com>
References: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
In-Reply-To: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1408;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=n/kwYOMR7eAiWhZVvnFhVSRXRzZNHQxPDtK0VW9Na1w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAKDl+exRoCxSgXKkfWo1bCLJugtHPQ5RgKsBU
 Be0CPNs2EaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawCg5QAKCRAFnS7L/zaE
 w5pjD/9xLwdHyFbKZWUgw/HnEyN/cyMIR6cnngISMQfyrYIhTxHVhyu7G3jbdFCXrvo6Xbo4fJU
 YNbpr5A0on48pvyNXpDWo9JtW8kUcLJWvksQlkKST+7effTOzMF0Ui6ZyLqRTtZQYHxa4R9RIAp
 8zkWigacXyIU8baZeQ9EWfWg/tCaPNuHAmM38ZDZPY0fLijH76Ea+ZzhUqH4JjEe+zSEnTwgmhw
 fhzUYzldccvlzzuDTDFikgoISQOivBNtqYxILxuSYoQGjZk+UNXaP55LqULEetHuEtziC5vpeAg
 Nl3LT+qNGq/Efm7F26E3x9LU6nxDZ+0tivj8NHlmJvLYArtSJmT8XauIt0w3EJGGV5zjgyKJF8A
 VwpPA0A/6CP8F9FZEqj6UVst3wRQzpupfJvH+I5FgRKbUNmDaqTVnkkBp7sgOewZdpJZmh5PKHr
 pD/BsJPYbK9ApWc02RcyBQxcscjs79IBp7dlCDkTxMYWvpUj7x4CjC2FE2LQ27bcZmDzQ2qkvFg
 zuGNW0fmCQpgXmQRslszqJqX8niFlPG+FKVYkr5Iio5Am/XA/cDBsBUUt0gixdI5y1ypgKZy7FA
 ugk6NAxVBKf9ifvl9Jb49tvQnxae6et7ze74GaKPUwpfsgrqHEPVjDi6hMaDdefQ4b8eJ1k3gNx
 tSOU5E6c4KWxi+Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=X+zHu2Te c=1 sm=1 tr=0 ts=6b00a0f1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=y0NJeVxnVzJs6a3GlOz7RQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5AW58fNYxLuDjIPvRSgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 0wcNp9NFAmtt0jmV-3DZcHx3xXZshPnv
X-Proofpoint-GUID: 0wcNp9NFAmtt0jmV-3DZcHx3xXZshPnv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfX/AYyxz4o+4iq
 w8QogyJe6lcDFyY9AH8cBUob8BPk1Vt1WB8S3HtDOX+I2hNbPcDqIl36ktAvcZ2kIeO8cmlhjyI
 iBn+M/rFMt4GNp74gONj+yDMX0aaACo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfXwEM+sxfhENbL
 CEAB3eBqWXHB5bMNwkEIN7am7WJ4joQfC8ZYGPtiPuQsaEdIcMnjTJuDzeNXYWUsbLUWj7hDDUM
 0PWJwAAebOkqCu1kyY8JKT0Hixi+7b4ouJaEfsHt+DNDOXM2nY+DJKc5WOSJMlztGJL0d90zHhd
 Ry7LsEih4gfyKADW131wezEs64+6EmOmQxVN1IPpXKORYYED0p3mSEjf/YBQby2LpRvuvgLHoE8
 gPOC0NiwNcXZymDR4KrhA2tqtE7WdOn1+UIGu1mOt5RZo5/EL6frbOB1cmPcray/xAzSj1PC3g4
 MQeARmBF8jy1pHpWq+unKhkIuBPdCzvMih25iqLU/XsLBWvlkAS9l/O+6eAgbsJyFd2RARfiew+
 jjD0WM4hCErANTCgrfJyLmpRuFGjzppNML97wNYwS4jOuvdMH/rXWvUBkc8DH3MunWYV/2PrCvK
 u4vUH9OkPIYdUKKxOnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_113515_459807_E47C31EC 
X-CRM114-Status: GOOD (  15.08  )
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

Most Qualcomm SoCs contain the QCE hardware offloader. The crypto driver
for this IP is being split into a smaller core stub that doesn't register
the crypto algorithms on its own AND an auxiliary driver than handles
the crypto part. Update the arm v7 defconfig to only build the core part
by default and leave the choice of building the crypto part to the user.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c54bd79c30701ebe59c0e6ef3b43309926154bb3..2413ad6f4d4b02163ad880bd8ae0ca30b1aa7cbb 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1135,6 +1135,7 @@ CONFIG_ASPEED_LPC_CTRL=m
 CONFIG_ASPEED_LPC_SNOOP=m
 CONFIG_ASPEED_P2A_CTRL=m
 CONFIG_QCOM_COMMAND_DB=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_SOC_TI=y
 CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
@@ -1306,7 +1307,6 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m

-- 
2.47.3


