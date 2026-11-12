Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6795606A881
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=girAWuLN;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cq+VVxjm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iVm41XWC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aLXIU9/c/oBQdx9HwSD56FRLf9Mqallr//0FEe+4FgQ=; b=girAWuLN52OXZ7
	xL8d3ddS6sPlbpNozQo0YPN8qT5mu4IHVPufZj7/ad463SPbXoDiA0hC1arQvICMXpvAbUIcUAzwR
	1ozkkEP/K9zGXPHnQMLwJq1ZZ8jvkCmGr/q4vUUEeF2imQ1fFI1WUAY/oDkhCQCdD3cWCLPXl3HoI
	+2IPspZWcQ7GE5EIdPcIVYzn5Z3L1U+6bSxjIuHARIHlBtVhzRipU2VEb8R9KDaZu3+crsDj3rlS/
	P3m9TEyP98Z/m5iXKRHgm+NPS/QzUKONhUdNgCvmUfHx17gPn30eLakGJ+GamerNH3UDEuWN+gowg
	ugUbo6gtf1POs36445yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUj7-0000000A0AZ-2tC5;
	Thu, 12 Nov 2026 13:20:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUj4-0000000A09T-3AOl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:20:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAUQ8d1629021
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 13:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aLXIU9/c/oBQdx9HwSD56FRLf9Mqallr//0FEe+4FgQ=; b=cq+VVxjmNqDwCS8N
	0shV36yL0oqsUY1jBiqYY8XLJlD9qWtMecXDbCojpT8AYp0Q7UJOB59ShSZnj0qm
	lIJThHMTa9e2fDKtr+qbjKeSZrJh0xhbxaqbOP5jt/6UdPjMTQL8Q5KjQRsv95kr
	LQytuAq7LAeN1ccit4dXv9L2WwFC/5jQjlm9aI2QGBvYc94YH+wfmAIxtqM70j2S
	i+vWh4eDE9p+jZ4krzwRwwR8cVPV4bkvbZzNCwvqmHI1HYZ+3jocTftreeCxoOdI
	SrkeVJp0e4fKzZidafBd//1VuAE11cWkcHLVZn8rk8ObSfZyFsheHQwBV302wXkx
	hYkAFA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs00hy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 13:20:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91ec0ed4af9so12002646d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 05:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794489625; x=1795094425; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLXIU9/c/oBQdx9HwSD56FRLf9Mqallr//0FEe+4FgQ=;
        b=iVm41XWCwT0wqBCou1Xy8TbeZr1pAkvGytEg6pbE4aUDClrQW2CbDRw0orYpN92IXf
         JSUCvp/vjUQU+efEEQCOrht/JFXuy7tl5e2+CojYn9XYngJs44WTqmVdZs1pV/y0s+ZN
         MzcWMHw1xTbA9X95hZxO2cpJrr7AEK5HhlOfO2WVo4/IUuSETqxtSgDMZjp366a5BCeQ
         TPGIb8HWG1ArlWguteGSnh406MypZrWST1Nd78qlGDT52mRYHnmTTgpSdp3aabQ2rXL7
         /Y9PKaVFh8xvUfkU9U5C2y58rY4bs++YF83UCMgP6/QIl/ZbfWgJxcQB09PZHVfZ3d9g
         BDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489625; x=1795094425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aLXIU9/c/oBQdx9HwSD56FRLf9Mqallr//0FEe+4FgQ=;
        b=yakzIT2FptSl1EkFKK2oJ2MhFO4Lx8tjMpTFJ6cVLLlfpdsX58OauXwR/X/WG9Cb7x
         3qpaQjiOXgnhLr6OGYd9eLaatXLVYhYwfJ5bqLA7xUlskTQkXuoy2R7hrHDnbVPwa/SJ
         L8LrdNwb0YeDxStbOjuGmAGPWCkAAo+o70ewFWHBY34MiV3IZRLKel/IaNzWC8JNV9eL
         CQhlPqpNG+kTQegOoU2I1LsVs8Iz8vr/L9vkFtERoQexeWEMMGpL2wDgb+KrqC50ZYz3
         W8STaXTPNrr5x02WR98Vtm6o+HPVCimKuHwsp69kZZQ8rV3XsavyiVOuBYAkQ9meViUO
         362A==
X-Forwarded-Encrypted: i=1; AL+hErFbHTmNk4zJAAfnkr32aL4oxTbnaKVcBcmXx57o4F6xfuBTJgaYEzmgcl65A6MLIGGXx/PygeXKTR5dUOQBLMNM@lists.infradead.org
X-Gm-Message-State: APuU4Z8H6nBtX2tj4NnbZ8fsa4625YeUAB5GjNgW7pdHAyZzyiqqaoaq
	Da4vWJ45ZYEuHNFB1h1AJviornbRZvaBeb1xfp2i7khczE05A39bgnbKSW7Y0tnGe/RR0UeHirR
	UVvmTva1murIAKMaP9OuIQBP/0EWB/tSfJ0tLnjuHwvfwKxu9Dp4xb0phEbDg4S2XT+XCcllLUM
	B1W0R2lp1ugg==
X-Gm-Gg: AYBFou1shnGjKwrgtxp+M430xADeL2o3GGBBM3tJexlrjhD7iN37dDkl5/D/kwvTybT
	CUvhAKuys3ieLhU6Mpq0Z6rBlNyqvtmP/Am/8xAYw35whYIPcfqufTzo0HCx3bYEsQRc/JqzpWJ
	3k+mN85gd1QWHvqIpggTvq1adFCKq+evEEZGGVABMjtzXE4R7OLK/QGdRr0xTVEjxxoJWuYZQN/
	OKTIxdqkH2vl0GY0TVFSq93tqn/1ehqqL1qqIeQLSboyXV9qhdRZpeQcgBReM4G7y9pOhnLwjAK
	j2AUxb5kJ12oJZUYnbTrSyY0VVJsZImwRysJGYzmM9bawO5ThNhrG5CC1LN8G7Wo0T7jOKW/cwj
	NkLhsk7xf+BZalrM66uGCJynYU4SIjbY0rFtO1FYnDBw2P+OVfF+nGA0uQ8CXkK8Oh6aArbRgAK
	bTPdVx/7xMsPv7RWM3rUEA50Kq15lOgGXzpouQfYWT72mT7Rm/z3RniDAAe53aGew=
X-Received: by 2002:a05:620a:462a:b0:943:7e61:fd9f with SMTP id af79cd13be357-94932c86d83mr416869985a.1.1794489624823;
        Thu, 12 Nov 2026 05:20:24 -0800 (PST)
X-Received: by 2002:a05:620a:462a:b0:943:7e61:fd9f with SMTP id af79cd13be357-94932c86d83mr416864585a.1.1794489624286;
        Thu, 12 Nov 2026 05:20:24 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a495csm16744366f8f.55.2026.11.12.05.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:20:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:20:09 +0100
Subject: [PATCH v12 2/2] Revert "crypto: qce - Mark QCE as BROKEN"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-qce-fixes-broken-label-v12-2-7b5b9c7083ed@oss.qualcomm.com>
References: <20261112-qce-fixes-broken-label-v12-0-7b5b9c7083ed@oss.qualcomm.com>
In-Reply-To: <20261112-qce-fixes-broken-label-v12-0-7b5b9c7083ed@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King <linux@armlinux.org.uk>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Birk Skyum <birk.skyum@pm.me>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3681;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dTP2OM2+e7NKLkzDC+WPH7nchMkBUgJbaO93VdjhD00=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9b0JmKrLP1AJ2kIffNsCs6yXcbF3sDHO5XOJt
 pSy15D8HFWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavW9CQAKCRAFnS7L/zaE
 w60cEAC0uUWQ5kQkPUz/Ov8Wb/2Uo7f8VDeC8/hyj8H74tQPEGSHz1t3J5Q/h/kULT1nCR2v6iZ
 gJS9rXcxB8PjxG8mMBw9rUL+Ku/xH1MkLKL/uAO1A0uSHePF6PJSEEVFcp9RSzBII5xBLf7ZdvH
 muzp5QSQlHCxld2wgcS0qVs35c3t1I0S7+XMWOCEVHhZXoOZJD5cHGxucvWG5uYbmwVv5u292D0
 GFngX+HJLzBkhEid1F5PAAiIaVmtpkWRoQU3ZhzwquVVl2W6MHXr/dZpl0ZwqAPFdugmqkKrvAG
 CZz8D9eRa3u3uIgzR7hqHPp8SWnoFuH0kcmo7vxjH4JkJpy6bxjzx+4UzlOVPCnWAZ7mbEbGjR2
 PmUQUlwIavhHTw3XGqP12z9CX29PXc8eDC6R+o/NkiIdHDcHwS5Gwt1AbjR6HWwVzvvLPOf+vwP
 QFR1RKdi776UsDGRL95ZcaUxXDUBMv23lKrYBq96e1mo4CqvabzajBVEOYQpEZyvNQrqcVFNRS8
 0N89wIzwPwXk/fDrVQiS3JBm9wrdWBOPOmVwaI85AWcPV91Xx2M4pFByD+Z9KiwJlVkhXPj8tBf
 Epn2/S6Qz7dH7foF2uf3zen9Lvr+KMy8i4PKm5FAUnR3Fm5M4mvH8s/Zps2eIe37Xsl31G19r2X
 W6xcBoqprEW9ixA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfX8wyOazirwp9A
 /nHaeqt+oWt+BxylSe7amFpbgP4zvHNwj47646g3Nz6Zj2E2wCA5dDBFZ1XjxNN6hmFqoKjKjhb
 E/FY/cnJJP8+enpCgiLFpIX13qZORTSw3nWNnaPIvjGAfQjXPC8+dno0wu074jUZ9L2S5ah26ZN
 43uE67tgg1VzCUxfsaa3uNLrrcXjlIXYwNMrlRz2EGOBMhUkGdsWVEeb0EETELlwHV0Pxk2iQtN
 LV7vUqWpnv7Gni+gVRaG0siwLYA+X0xDZ5ExasDCOb3LUFW4q1exaP8Hrx4Eb0bqGKAn4BAk5R7
 vJg2TxIFjgBQtSS1lthyxEEh3IuLucFCjeVxEoC9zBPXTw1UJm4VmBm8RtHX4uL+0FFlL/SzrBu
 NlZHOSFL4TBPgVr8CIMgtNNg7zUEXKoNobdBplW+uMjucwea7mSBsAYRxIl4wwp0fMOL/TFEHO8
 hixQS3g5/AmovMNKFfw==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af5bd19 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=W_IakApU47TVE70GsD8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfXyKVL54++iwAS
 0ksGq0MyMbvyO6p/c34Ar5ocNqq88u7KpAYva59MHnOCfNoYH/9DF8phPATo3YluwcTAlQW6IJL
 IID50rUEFTcfpez7feayKMqWrTwgulk=
X-Proofpoint-GUID: KC9DXhQSUUdS322RAaCFQ5rMU_aiipqp
X-Proofpoint-ORIG-GUID: KC9DXhQSUUdS322RAaCFQ5rMU_aiipqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052026_967817_7E6EA47E 
X-CRM114-Status: GOOD (  18.37  )
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

The self-tests for this driver have been fixed. The crypto algorithms
are only registered if the user explicitly requests it with the provided
module parameter defaulting to false. There's no reason to further keep
it unbuildable with the BROKEN label so revert commit df373d39c6f0
("crypto: qce - Mark QCE as BROKEN").

While at it: update the Kconfig description by saying this is an
"offloader" and not an "accelerator".

Cc: stable@vger.kernel.org
Fixes: df373d39c6f0 ("crypto: qce - Mark QCE as BROKEN")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Tested-by: Birk Skyum <birk.skyum@pm.me> # X1E80100, Lenovo Yoga Slim 7x
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig |  1 +
 arch/arm64/configs/defconfig        |  1 +
 drivers/crypto/Kconfig              | 22 +++++++++++++---------
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 93144bc1474d9824e16a0801f7a1246746700227..fee64572027ece8a07524db7bcef5a4ccda71339 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1305,6 +1305,7 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
+CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 898f4f1d595203fa61b2a99473b6ea06ba7abe58..f9179bba64de773886d20cee388293cf9f538ab0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1800,6 +1800,7 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
+CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 0189dfdcbbe11098ead0ea194293422a31d8fe65..adcbe15851899917fb3039efe89a77c8fe712bf1 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -527,17 +527,21 @@ source "drivers/crypto/marvell/Kconfig"
 source "drivers/crypto/intel/Kconfig"
 
 config CRYPTO_DEV_QCE
-	tristate "Qualcomm crypto engine accelerator"
-	depends on (BROKEN && ARCH_QCOM) || COMPILE_TEST
+	tristate "Qualcomm crypto engine offloader"
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
-	  This driver supports Qualcomm crypto engine accelerator
-	  hardware. To compile this driver as a module, choose M here. The
-	  module will be called qcrypto.
-
-	  This driver does not have exclusive access to the
-	  hardware, causing races with the secure world.  It
-	  is also slower than the CPU.
+	  This driver supports Qualcomm crypto engine offloader hardware. To
+	  compile this driver as a module, choose M here. The module will be
+	  called qcrypto.
+
+	  NOTE: With qcrypto.do_register_algos module parameter set to true,
+	  this driver does not have exclusive access to the hardware, and may
+	  cause races with the secure world. It is also *slower* than the
+	  CPU for the same algorithms. By default it will not register crypto
+	  algorithms and only scale down the interconnect bandwidth and disable
+	  the relevant clocks. Use qcrypto.do_register_algos=1 at your own
+	  risk!
 
 config CRYPTO_DEV_QCE_SKCIPHER
 	bool

-- 
2.47.3


