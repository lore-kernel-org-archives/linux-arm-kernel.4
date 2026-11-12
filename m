Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CF1606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N2I0xDdz;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q08zPKvt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D2KWl+Xt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7KlceQbgnYObNWEcS0jcHmtcmOkNcG0VlHdLvVEaUTM=; b=N2I0xDdzcYDRK2
	h3tnP2xERBu9SHEFap9cc+Hs0Ef5HCBGLuTSq2+aXN21CCpwio6XhJxVmJgXnMWzhl3T6zIARuexW
	CgNGSp9Retg64/pj+L/2CljkVFlqthgHKOnaU9AlVSWN19WFoZOjDW1E+nZ96F1ucjO1ApepAp3Y9
	bisnKMay8iqYr2SglW+yu7lglQko846LY1JamV0NxoOiaOlB324kh5VrPhb2pKJDphcnxvkrTvWxS
	3aSA4AetWTIAC9WGmWpuGbc/Y7/Li5uficF84sCWstmahlRn9LOULJbcWCN9J759P+U6zRkY3vRfp
	CCsgnUTpn0fBMEltMcnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVWB-0000000AClq-0eDR;
	Thu, 12 Nov 2026 14:11:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVVx-0000000ACeo-1NmW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:10:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACBRa543893507
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 14:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7KlceQbgnYObNWEcS0jcHmtcmOkNcG0VlHdLvVEaUTM=; b=Q08zPKvtWQ7/BhRg
	dADUp26Zn50BB1nOQk9IQoo7l4jpWASz8V5Zz3+dBG5oVqNrtIeqX1GUINuDREem
	OCqRCueHPPZpXpjnJULVG0rESSrg28b6cdWsuj+3xNNwFxq3owvsPj37SdwE/c5s
	HYglpttYh8ysA7XMocq8xRO6NpO9oeeue3mOllSJ6pyvcU93gfR7vYC5kocLHXnM
	j4gA7Js4khBI6+6dy+93MGe7fkF6dZJGQ7ijM7h8hJXjECW2ZedL7eeJoK4Y7tPv
	swGedbJsOw1Kfnf5dT9wijHJFzmdDVkXC4PO+RkTgyC6Rc9phdyyEIxdUityaQx7
	Juqe9Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re1x0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 14:10:56 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5edf86a8c00so1032218e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 06:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794492656; x=1795097456; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7KlceQbgnYObNWEcS0jcHmtcmOkNcG0VlHdLvVEaUTM=;
        b=D2KWl+XtC6hJgUsLYGmHimERLX4XuRU0aClnQ7NWsPVnDDsWojl7u0WD/DK7OPmxko
         s7v4b8XP35HRdfDxjeHx74t1MBPRqW/v6p01dQMIz9/9q61h24GsO3tGdZc+IRDL1T0T
         Y+AnvrqaKVgIRp4oo6c6l6VsKJlVWxDHm3Xu9wa4XfteouxU8wVU4YXAefVBU+OVyTqC
         /nexeJh/SqfSfuE/5/frR9lzLAnFMLN85zOOADNFj1naeivlbBskICMQ9xhywSJJvJpr
         Ay7AMq4uG6W9g4idZVggfVzRSrRWjeDuvimMytiRIE42xe4okeSQ5xKojgGUZbMSlBup
         AWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492656; x=1795097456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7KlceQbgnYObNWEcS0jcHmtcmOkNcG0VlHdLvVEaUTM=;
        b=zVG0s48KtDCyugMHmDXpVxWwiFfon1y2G3Hec7ep+E7xjvMbvXBPmcj0lzB3DqUCPF
         KZimfedZlhoD+HIC15KaWwBIrnLg9jO8GrHgaCtwxzjzmAnXDZQp463DKvKKMsSAncBb
         Ub5jjIPS7c4pgj1nY0sd+Jg1mWlS8+lEoe9fVXxiQ0WDTv9j0u6yQviem4xgO6ODHhoh
         BzGILhE9otRqkfBD3SjMmW8Yh7cvAmaopqKtLLOLr5965Lm9PLjsWAU/rNpthBLT/zad
         KuijitBGfZIGzdO99XBvLNPW/3H2FcUcv5h642mMO04G1BUfowvX5uh3dBX8mooFfsBu
         ukTQ==
X-Forwarded-Encrypted: i=1; AL+hErGBPPFraq4GdkXWm3mI6tDTAyoPoRamRvhwEJbHYtlz0l4H0Qbd4tczAJnQJR2agIAjpAvubvOp6g+WedGwtWXa@lists.infradead.org
X-Gm-Message-State: APuU4Z8u6h7PZgrVWufaSRWZROKFCyi7rsec6k7ZJIw/jqgzJiadmev7
	wuB7dsv1VIV67Nlfrm5oeP0eu+NiQAmvXtRWoZYOhjjQY6ZRyVyTujQmzu2jZVSrDU3tceDSX9Y
	zjgl0m3vfptaMUtY6LoqIN6R81byoIHNOWgZJvdsEWckuyGO78PAQ0UysEeeoIVlnA/7yii5dMQ
	8nEw==
X-Gm-Gg: AYBFou1Wpgn10f5H578vERRaC2JXHFP+IyDfni2WSNDB4XPS/M93NYMLnGrcy6Er1w6
	YHhmTyHkUDBH7SBcRRXBBxVOm+Xbl8ryTz2hCsnqak/06fwrllLUEnJrP6gQLB054gvFPw7bIWV
	R6ekpTejiG/IhVGS1V/7/AIf94BuMo5p0UvvPZsC4/zaxE0Xui3YSu45gUPK2z9i8f9StHyLUNy
	1xzbLIJeZYdZuwEPpMg2v3ppTKqUmxmHeKDoMsKdNkZVielLiDsiLwJcjmlLWgkbgCLJTPcXbm0
	d/h+cJkyAl9EFF0Z10f4duTGfNNez4Mq9CSIFXPAUjLWSb5ikGu5IpWXBiItN9Lnl6TxZcORZLe
	Jo+OS8/mprzUCdbJ0fcgJI9vZaZA8jGS7FPVfxuurhPKkwZ90MzCvIjrTMVstPlD6DjQ8c9Moqh
	qcdsrq9Ua0lKvrflhgVm+qbX2JQXIz902gyS/JuKGdAkp+eJH1bKQuo5Rl7fbIPtI=
X-Received: by 2002:a05:6122:3286:b0:5c9:a60d:3276 with SMTP id 71dfb90a1353d-5ee1c3fe5eamr2294765e0c.10.1794492655766;
        Thu, 12 Nov 2026 06:10:55 -0800 (PST)
X-Received: by 2002:a05:6122:3286:b0:5c9:a60d:3276 with SMTP id 71dfb90a1353d-5ee1c3fe5eamr2294739e0c.10.1794492655342;
        Thu, 12 Nov 2026 06:10:55 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e271378sm81817775e9.13.2026.11.12.06.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:10:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:10:44 +0100
Subject: [PATCH v11 4/4] arm: multi_v7_defconfig: update the Qualcomm
 Crypto Engine entry
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-qce-fix-self-tests-v11-4-b86a65ee7107@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1408;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FctauFHZADEzXXldL+PPLca+nRIKDHu5xhFRwimXZqU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9cjlCVirX+YzppCZQDD7Q8AvfImymH8ZnTh2S
 ZJ/vwk3hAyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavXI5QAKCRAFnS7L/zaE
 w0iSD/9/2ZqsJSw3c5O4JMZk8f3SxL8A0Hln0Zj2cOCj4wFI8HOgqaviwirUZRlWo8qjhjP/9/B
 MzDmcswmU681m7LO9AG7i5ll/306S+G71IBN+owa1tfaCtj1z4nRQ1rTHj/oxEZq5O9s7udaKgk
 sYIumk0AVBanFjk3sdkpPJ2CDV4C0Pub6DSGzIzbnxLy501Q0a9JcuUmaT77OlH6yhi/UvI9hG6
 dSEPhyQPBN8JRRa6v32M/AKxYMQl6WDa4jCyARk8AHO/3qeEBPVwbEO50LI3t91WFtx0jp9ZcCB
 t6wVvD16WX5FhO69Je/2N7MhRI02s+oi2V2DLZLWcp1L+wmeEESgmcKWZzgxllNG9tG6jvnsW2t
 u4bN/1iYJm1ny1hoiGEIo1VxVZqWhUj7aJ0RIhaTrbCQzhNUjApD3QWKPviPx8OfNJAYehNEyu5
 vf8F2/Q38YbRqWEFA1NH3TavFkMssQkvSHYMYfCI1TF6FCiqyMNE6yUafhChQo132zWZR6Kj0xq
 P5R6aXe4GBBLLPRwRrl5UGKPcesqKrmdUnJ9eLFZ2mI+S/UAUfvmqlwSmTH789OUX8L/B9o6UFV
 PUoc40n6t15RSZrQFIoMcen4tz88G908HtwaJB9csvqa/vY4UwwuhQ+2Ob7thoSesAY93GLbqge
 EJ+ziK/bFuvvLTw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: DmNV5MULFU4CyCiL8HIiHJSrTjXxYWGe
X-Proofpoint-GUID: DmNV5MULFU4CyCiL8HIiHJSrTjXxYWGe
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af5c8f0 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=5AW58fNYxLuDjIPvRSgA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfXw8hMuCqvDpUQ
 zCpQtvmlMdrOQnJSohi0OmDXmybEn1zxvcl+xaioBAk1ngapVSvhh9pe1BL7o5kLtcAeGCMaB++
 yU8yrNCDIGCftKAZWMttleVubEi1jeQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX7lmqzgIDHKiF
 dxDqFiAztuQoR8ti1CxqaPq1SKoBcHlO/LhqG+yvrfDxsFpkISYRjW36N02IazynItEBswJc2E9
 MrbOHrYqJaLVsJp/7VFCcnsAOdR9fHk/5TKEPGsQA+550nKXRdOYNC0jhWZPwH4dnsCaH+FEp1A
 Y1XbZUj4uNyl1whZ2bMra1ZGEtYHTyZGyZgARBnc75Ly/XADjQaBx+BiV4Zmxrcnsjd1gqfwWEM
 Cdwkb2z+5/exKGDDULvhukheAvFpz7b7MFoU4S2m8vCf2N2QSi23eLceJie5q8xL045vCwgfxa4
 qmzsqfZ6twYBd5lvaH6rqT4FdUbqje/a8QtJ0QT/U6b2GI1yrlae+JQ3Joi/3FoiuuuWvzYHtmw
 LxxSuZYQNl9NBZenER9I0UltFoaqf65sh18knYrvZfzXk0TIPYh14DapbpmD0LRSdt1co4FOllT
 AuxvME/Fdx9QUkKcOuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_061057_398906_5E983C50 
X-CRM114-Status: GOOD (  15.70  )
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
index fee64572027ece8a07524db7bcef5a4ccda71339..40b0d2a8ed1eff5404dd6e821433044475043880 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1134,6 +1134,7 @@ CONFIG_ASPEED_LPC_CTRL=m
 CONFIG_ASPEED_LPC_SNOOP=m
 CONFIG_ASPEED_P2A_CTRL=m
 CONFIG_QCOM_COMMAND_DB=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_SOC_TI=y
 CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
@@ -1305,7 +1306,6 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m

-- 
2.47.3


