Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D098606A88C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j70F9jSl;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WVGjJzZI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XPfJuI3/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nxz0IxyZ0qklpIDkMqdgjYELFVGmdSKRcaGfWcs3vIw=; b=j70F9jSlNNE/SA
	f3iouVxwafLYs110t1p2KeQEQUU0InnIBc5elx0SpK1CwBZr2O+pctwKKgkiVh3um5a9auFE51aOs
	Qk2N9KZtdI6vASiro2KReOkI7rbcuiH2iMnvUUgKjNdNDVI5EdKWJRcZs28l+9aUOfoXt4fgzgItK
	ppWv4fVLjbJzi6G4K9/iYcTgsdiN3d4GS8AYMtXUw9DR8vXdN4nvSBrmOqhN//kz/RoU9C3sVPWcl
	H/5o5T+i1qS22oZzbr0ZPIM2/ppEEedIONhqmwltGgxZu9PMXp6/2hK6pJHULfZ05RasQpGdGMLJR
	bNtjzFz8cgI2Pd6+FJdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVVy-0000000ACg9-3iDg;
	Thu, 12 Nov 2026 14:10:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVVv-0000000ACeA-2yBq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:10:56 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAfPML1954171
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 14:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nxz0IxyZ0qklpIDkMqdgjYELFVGmdSKRcaGfWcs3vIw=; b=WVGjJzZIeob9bIej
	nMTml9n/R5SiVaogsSaU601e+NKusrEJNrB1jiXFnCrVNuQWxA61+RsKgOKMo2tD
	0BuQxqMtPfyepnT7jSxJETcghbMBgKat2IoRurTgCeiL/V3W+SwhDIAiLUYfdFjT
	9e6cy/J9EwtLOwQz1wKZt9KDowLVBqpNh5DjK7dXIRIGLG8pxtPMCPe63Um7zcnk
	B3UPrlZ0uABRTW91QWIV/kkS8dk12vq9bQ7qOFtoQIn5hivvSn3JLMCTK6JyiUXU
	MlunMISvIlRZGQ+Y44WRaQQQjZSxDGycBvh5leWdEgnBJ6w9oQjC+S0K6sWZw5Lm
	y1tJZw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx30pv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 14:10:55 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eac42e83e0so1092564e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 06:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794492654; x=1795097454; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxz0IxyZ0qklpIDkMqdgjYELFVGmdSKRcaGfWcs3vIw=;
        b=XPfJuI3/pAEIDdwfoQDda+rf7qk/CoGi/AoRmve28UBVgX9+JJs/ilaX6wNaJ5GhUf
         HCnlTZZTbNHCQ4Xp0g20ahzaWgtPEjAU/Q8GzE3eLr05GtNG7z7Asxo+yLtiSOI7OIsV
         PD7djNkSyFT1cvXf7mLYIOGUCak9eEIlOYYZ7qOPm1SpV6HExX+zmOb0408i5kUzUFsd
         Q+TSaiALsBDA40n6dHdjO0TKUJn6mgBcxaPYuq03KKpvU703zcMg6KZ5J5mImH63G+gi
         IBpsvrBI3QdqtCHA3AEC9AqlMxVGNLiO9nk8RXugiatE7ZqVgezAEzU4E6EsOc9DW+nG
         2Amw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492654; x=1795097454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxz0IxyZ0qklpIDkMqdgjYELFVGmdSKRcaGfWcs3vIw=;
        b=bv5b+Jq3VyajZrVakRHC6wCZT/rd0GRCPrcLUDHvtqF0t2x1qqw/DMEuFTBEBWFC8Q
         31TRe3y6+f9OkxxkjvCsqMHYc+X7FVG3s4OWaZSE4o7mfP0aHFo6ZWJPrVslDueXjNfk
         mEd7L3+lXAjWA4UKajgEcQDO3u0jjC53b1yLXInte8opKG8wQIEJCDoiS4yrsgprmEbF
         qXhLs7eW/pNC4tE4GIsf8blSVg8Eh47L7XoN0t1SPz8PnUvnNvxS92CybhS93uAqOPCd
         ntKgLDUx5S1/i80Ri5Mw3yuvUuJxzohOiIvSeOzYexMFbTVFOUDPIfJZtAifrMuR4QNS
         oH5Q==
X-Forwarded-Encrypted: i=1; AL+hErGeAPFGX289n5kegkDzzEla5R2Dlb98Lz5GuyHJgNpFlM8q2mVB3ubmLnVFyDSHvurQDvycvTW1q1wO8vz2TT21@lists.infradead.org
X-Gm-Message-State: APuU4Z+hD+JUjsjJtOh64bg+/s772JL97ruBujN+O0/jG0PIIAAXe5rw
	iPdyE3tdqpRie19fpOMQyaFRtKdGh1vf6oUloEvIVljdU3MQ/9VmvTh5ONdVxXnWJbAS3Hul3Sa
	ska8VvwIF8pqcSU9X2fIdscb2WfeXgSUYgYKWbYjNRYNOYch/aCel7FiMCoBDE9/rNbTkvqok+y
	vqkA==
X-Gm-Gg: AYBFou3AsQqAJDH3CzyjY9ApFAi1y8GYpjTW/Y6ncmMj6BrH8LLfR2wroIKYxGRNQvY
	JUOJv3xCUW5v/uEzpQe5dNm+zQ9zsBLebhUQTBQIhap2b2sZn8nVk6nQp2+yXo9lN0vfzXXPbP1
	vnF5ABHpzz0xeF7NRwPKHHVJXMwq+yrdFa0+xvP/6Q9LnZzIZsZxTessuvJWiXVQjIaBEF37r/M
	vyc0oDvHMK0+l/tPV/xg2f9ahGJZa6gB4K7M3JKsegaH2p8H/j6QQieikdGOkSRrysbcYht2tLD
	TrrRp8Yb/itaFA7LNguCDZ/IMmLQ9c0cPYu6vdC7OpxdrEzgUOi7zXN2wjx/L3iLT65PasYWdQN
	JBQtL75JecJGV9vKwA9reyVpJ2yDvZLrg75lUPFDPtNjO8h+iyyPwBAgYLOzz1fD3vLMeem2e49
	lGHmooFqUklHVUwe4gZmf3Vytp2wBGABuSkepC46Woo72l02gnIxfVLrJoNhME/fo=
X-Received: by 2002:a05:6122:3119:b0:5ec:d70c:6326 with SMTP id 71dfb90a1353d-5ee1c46be08mr2351960e0c.23.1794492654246;
        Thu, 12 Nov 2026 06:10:54 -0800 (PST)
X-Received: by 2002:a05:6122:3119:b0:5ec:d70c:6326 with SMTP id 71dfb90a1353d-5ee1c46be08mr2351938e0c.23.1794492653647;
        Thu, 12 Nov 2026 06:10:53 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e271378sm81817775e9.13.2026.11.12.06.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:10:52 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:10:43 +0100
Subject: [PATCH v11 3/4] arm64: defconfig: update the Qualcomm Crypto
 Engine entry
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-qce-fix-self-tests-v11-3-b86a65ee7107@oss.qualcomm.com>
References: <20261112-qce-fix-self-tests-v11-0-b86a65ee7107@oss.qualcomm.com>
In-Reply-To: <20261112-qce-fix-self-tests-v11-0-b86a65ee7107@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WtO6aZCAkjOIZjzSkn3SdWOc0GthFTg4IDGn8knbBYM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9cjlADNyic9kqSgOBPEjApUyRLS0M2VjdEVhi
 jHnGi7k/RyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavXI5QAKCRAFnS7L/zaE
 wyNHD/wN3ge3XOkQAQewv1CsqcXmlrtv2VRnzTM2OFXGbrdEGMeXv9p0wAH+LrBDFSwseEfUuIo
 fbw78Sc2HpDlmS9/rd/11olWyIQ1GXulBtwBbzr21c7m0LM50t8IuVafGDmdENGI2ZzpDGh8FDL
 IHy1facCttMxma6eLUlEt9nrW/qIf3wNAwZbrllDQLnCEFAXI2QUC2BoGQZYRjKX++D5K/eHAuu
 WkF325e0JMpBnPAttKtworXrkzu8X5u5CMKGLEii5sh/p4fFMCiQwgkYKZF8L4JiNhhJyxDDbrB
 YWYXE097EzSfukj3M+9scO/syqzPSTiUFL3f6wLRTBs1ZU+hHeZx9bWwp6ZMwB+j0DWvbUczjsG
 RZk0HxNDWbFbl4tcIyIILowMuWCcmTqGkCrdAs3K2jkwUgQcHddWtwiYMms++oXiGuCdA+Th+Mx
 kxEKHrLevhBvAV6J1BTQR9tVRMY2CgcMIlKDCeQkUHw4yIKiPKJvI469x4cYy7xMYHjIpTuWyZZ
 MJ3ujyuEyBzA2GeAUMjU3//XAEcqnWMqxFcTmzzMsGusY8zrPR51LnO6TYqpo57dlj3W72IveOJ
 Yn9a3mKVS4cuG6G3P5sQS4p2jxOzLmWLLGa80hruLooShMJHRFx13mTp4kxiAxkYvno0vtQqy6B
 dn8alaocjC4w0Mw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af5c8ef cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=5AW58fNYxLuDjIPvRSgA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX0Ey01OUNc2/b
 8hWJ5U44rvLdKxabPTdLoMUTqYiV2nRzsyr6iLlJTOdkgw3tmBih+zgl8pZpti8Xb0Jf6wijJy7
 FSngY//TpKpfdMy+ask4jRFnzm/iCoO6F375fpoWJLdRMO88pjKL56nXK5W/LnbZ1Of7plqhSPo
 wHdgU7YAel4dLV7uSm5SdoREn0/kHM94fEuXWwrVJiQgI9ZOYfEe8hGtRvQ594qrJz2TxdsKSPK
 BrTj7gYqG6Cb6qQYLyMDfdvDyKASRsi+J+nyVjvwNbw5p4klzEVHb3bzQbhJuj0tIMcWTZhLVfp
 2CRolgbtzuv5iMVQWlRxlLoR7Rr+5ogiVcaXgP11SExovFzfMeSxXgsaiwJEgjBgQ4ITdyGyQun
 G25/wRoFmz5bHXlUKCWRUv8yoD4KsmFjuhxdDDuCC2rQauQ3O1X9OwDIq39wmcF36ABIXLpUXir
 6j2fdwp0ZbbFxKvrE1Q==
X-Proofpoint-ORIG-GUID: QcCPoOPWdID4jhE68SnOq2EVaG9v5QE9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX2yJ4kDc8Qdwq
 PWuWfrrg2wUhCxP9RTYOg2zKlRln2UFwiGOP62E44TwARLhLDF02Af9xD58dIYWK6YDyVXYGrBG
 xgXhMf/hhyeEAEtOfixhMlIo5oHRHyQ=
X-Proofpoint-GUID: QcCPoOPWdID4jhE68SnOq2EVaG9v5QE9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_061055_775697_4DDFC2D0 
X-CRM114-Status: GOOD (  15.82  )
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
the crypto part. Update the arm64 defconfig to only build the core part
by default and leave the choice of building the crypto part to the user.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f9179bba64de773886d20cee388293cf9f538ab0..cc81a68f234b9818331d05b51b40735c3296fdb1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1550,6 +1550,7 @@ CONFIG_MTK_CMDQ=m
 CONFIG_MTK_DEVAPC=m
 CONFIG_MTK_PMIC_WRAP=y
 CONFIG_MTK_SVS=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_SPM=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_TI_PRUSS=m
@@ -1800,7 +1801,6 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m

-- 
2.47.3


