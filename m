Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8E6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xzyBaUYq;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bgaAsR3u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RqwyXMRE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oXGSSXGtbkPXvB7nHrz702paXG7FvJx+QlGDGhbF1l0=; b=xzyBaUYqaaAcgc
	Jf8QpyCPROYoqx4vVFSM4dvLUELp1HLERc1A8wUDaeYJpcS3wuMZXmDTz6hV+sR9JWoS/lwi+768+
	n7hifJKJWgfL544Ocw2stfgfVHzlIqJ5g2Lzp1nCezrTUVPzLyu1aHM1seBBNW19IyQtndpEvOXTp
	S2v3sv2+X2mkzcIp8MR66Ms7tDrfN+3SW9syK621TgOI2JYkfqFztUtAgn2lNptc7/GalHuI9OP+4
	Ts57+CX/b2glMFKyis1KsHZ+76soig4qOG6pwwkjtiTXqaumqDcZrzQlBlabIlcawbBsKuY2NuAdF
	CrInvzyPTiuoTIewHZUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVVy-0000000ACfi-331i;
	Thu, 12 Nov 2026 14:10:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVVu-0000000ACdG-0dFF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:10:55 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACE2e812818859
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 14:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oXGSSXGtbkPXvB7nHrz702paXG7FvJx+QlGDGhbF1l0=; b=bgaAsR3uveq5FK+A
	AoA994h54RJAfAESM0C/mGXB/bkwKxtovBnQGAegTxo745VO1rn2Zhzqc8tOfxfn
	Xlon1xTjuv0t2/G12xCkRd/Aa4CnAtJk5JPJGkEu4K3ZU+fMCmWuHvWFdpC1HdVJ
	3yymi6x3LcVchLDDAJoR408idd4ZECadXHtdFN2RXjKQZxsBcydFGNipzn2F06Ay
	c8NKELgHzMn9/piAMZQmBljBQWNxO8IcL8+PBb17Jz96pVWz6botSNSTmVpOWJ4t
	PkWqL5acXVJgXGOFOzp6RF3sixiLnEjWovQMqkzezyISyc+L5Rf4mV9hv6NeMmV6
	cASBJg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e19ay4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 14:10:52 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99859876e19so776883241.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 06:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794492652; x=1795097452; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXGSSXGtbkPXvB7nHrz702paXG7FvJx+QlGDGhbF1l0=;
        b=RqwyXMREwOUn0WGybOvpbkVxxUggv/nBmTFowkpExAAUEsB/mjC6pqRqyvhkf/dNy5
         41oimr0TnX9x6VhutPTPkCnD6zo6CioZFhFvSA6SNWsETMQ6Efdsowy0s/YXS/3Xpru5
         E7eY14kP95HI+fpX6fGwWXvVsiLNekCjjhx1k35ZAA96kKQMhk7ToW7RI5muGLqmRDJV
         LFEtIRgcAOo46gzkcUG7lGQJXpBxIBiFkssuTpiftRUhjmpWuzX+4TR6vn/cK8G+xolw
         fsHKs1G3vJ+DQUw5w6raua3JGPQPCDXgti5YUWa6+9fRryoniaAbfULgmeFtWmhg5zxn
         NWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492652; x=1795097452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXGSSXGtbkPXvB7nHrz702paXG7FvJx+QlGDGhbF1l0=;
        b=0V6w1p/gc4jhZUJoTyNoWjB+pfcTHyBHxjuA9hvIAXpNcw6brgSt9Zp2ch2dD66Jbw
         2V8nCfkM3k2dM+f/u3W7COVDX3FY5fFCssgMkP/LPigmxfiBoDgm1wCAuv6Yk6h9S96w
         JqGwcogeKcv8gzGaurY5Ij4Owt7kLTIETTmKKyecY2215AEHBmz6NSwcupBj18Cq4Dsk
         73PMm6e8SyAR4hN+H9ieocC+JwMBYY3KxqsDH1uLwi3PWkL5bYBjGZ8+NZHZ0eqeBBjb
         IxFjTCqTX7g/YxBrebqRe5KrBMaqgy7K5N/uUlekIUM3jSIM0LjX0ElgpxITwIjie3JU
         4adg==
X-Forwarded-Encrypted: i=1; AL+hErFYSPE5j/zUhYiCF/MPZcBf3vEIkEgzETKNyKHLL3bkQPfN0CN3D8NFomrNmLXmDusqhM9u3Mblpm5gENR1jOS9@lists.infradead.org
X-Gm-Message-State: APuU4Z/ryd6NjnvldUkuzwGTQWiHqdIT7N+iPUfnoHg9+322WE2RsYAw
	CzEsNmBpGN2jEz3J4hugfLH6Wi18nbxiWwbXfAOnEIlfjuk8+o4yAJnbvJwyYyiBN6ayshFaXah
	H4Ls4kQd6QEWjQsk+OzcaxYHMn5qs0716+qHp0lEbx1vAHpdptvfruTqMhJMF1sDIj1jSbd4XDL
	fwFw==
X-Gm-Gg: AYBFou2F2ViS8abNk47D2vM1t7uTkzg9ke+1kKuSpAfQfDUSYqsIHlCR6R+88cbtv3w
	Zox5z9C7qqVo8+g5m42B6RgzjuLr6gZVfrrSGBa4RNsUk68ATIN3c/ZzPMH2XDsjIwqxdo+v5a3
	zoora2yqHud/7WEWHTq0xAXRNwm/7cJsc7yWN7/qr62DioZ5yCN7mBkwyx8p8kKCl26/o4DpQt7
	VqodqFDMCWNU8K9TvLRiKoj4mprWm9Gbgc8cKEGsib/txc2OD83EdIO5nDBQ8gM7P4NU3ARa/mT
	HGnGQu+UdRgCrp7Cy5hWcuoziwlvshBcCVECMxa3qT7VsWKJcHZ/TkBoO50L/h+U0RFotMKzJdo
	dEpdXgQmu68k29O8DwLdN+QcEDnvwxAM/Gr5jJmQMLbDd7CC5YjC9fufIacKO4ULXgHgI8/Tx3x
	hh3Fcd/OVPOirG0BVfQSN51wQhIa1AeUSs2YvZam24VP+QMarDP1OAx87giKWPIMU=
X-Received: by 2002:a05:6102:370d:b0:7d2:cc5a:f0bd with SMTP id ada2fe7eead31-7d4fb2e28b4mr2056769137.19.1794492652221;
        Thu, 12 Nov 2026 06:10:52 -0800 (PST)
X-Received: by 2002:a05:6102:370d:b0:7d2:cc5a:f0bd with SMTP id ada2fe7eead31-7d4fb2e28b4mr2056752137.19.1794492651710;
        Thu, 12 Nov 2026 06:10:51 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e271378sm81817775e9.13.2026.11.12.06.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:10:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:10:42 +0100
Subject: [PATCH v11 2/4] soc: qcom: add core driver for the Qualcomm Crypto
 Engine
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-qce-fix-self-tests-v11-2-b86a65ee7107@oss.qualcomm.com>
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
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4989;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DCwoS/LvISiRO16djPQOua92B5KrkSUJ5INr10E+D0Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9cjlekHn4adtDthK6Pr87Jj53xre20mrcTQ/l
 5BLTafMcjKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavXI5QAKCRAFnS7L/zaE
 w0inEACoUhLjGJYZi7GYfjLxc1TvdYUHF6eRl6bNiexRnFPqT6JqZ1KNVQOZMlXFof1HS/7Si8h
 Wj6tA0dVrD19EWqYCtHC298iY83qy93sQ/DKAMKPo3q2dZp1+2F6TlVXsL1/oih63tNo3aiQLAd
 TXvkpEBz0X2WPWc7zII6oQY3+SwyYRHL5nefoox99nnJR3Ije4rXm6RBOMmNT8afJr0Vcvt133D
 0uD4vbFFaCfTMrHOcWxp7Zu+iR+jGglAxfmUzzos6LTNqBYqFeOTagj84iTJMjcWBDQu+Hd5x1l
 YPGIgGqDYEWnUsUi05nZi5LrjuOwTEG4LU3tIGXEVNkKe2kqG0AQ4yYGh0t8AQRtqI6popUrBar
 gx87wC28mfapTGWpys+p9tog+VEHLSyStKOE9u1mDO9PzWb1C2ft4aWa0mK5FQUhg79+SQPYXE7
 Chh/sFAe7v2JQ7NzpbTWNJE0kGY0+51Voi6EHA9RDGDSKlkT04PAkhqoid2TEwXYnKS0Uzp/nCA
 nWgESU0DskrkVu4LLDQKwYe3FKJroz0nOWp2iUae76VUi0u0r79dTvuO6z3uVILgPP92DCpB/vq
 saXfP9JjD+7yX3s6fxKQSbk3TKKpMyP55yR5f8OhliOcyDkNYEXeTrQ4+7SOwnv6iy+ip5WN//L
 duzddPjJWHL/g8w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX0+vlVd04Yjw6
 RvWndsuTc6a+xjnhoLOGmciE8R9lYsp08LQnoIVV4WYhdpoVvXYgeyisX8rWV0pZTHhm/NvNjMd
 XKcyVVvvkm8NcIMrpjM+wt6wE4AEfK/jn0bESD1FLYkyiWlyxUYPPMGaL25mJSWlTkiyfYBp33r
 3aKrV5v0TQTBCf44CTEh2jJHKTU/5AlrnOy6Q0Pa32vqw+D9Wb1QZ2PXWJgJbklkAYpQ3bRVy1M
 tpNUQ56nF6d6sCuXBBnGTiN+TduZ1+7UuRFh5hokaKV31qBRDg1d+qKi0hf462ZYvujkLu2RycC
 lGP8YqAUlKXgeeqstpY/dymRrvS8fCFViCwQGGtLhSm7oDZTb1Pu2OztEyQSEbBRWlzdopkBaSS
 xLF9XcbS76o+PTsXN0dFt/clCijUIZAmUAuG5UMPLPZft0r2AEELBu+I3bejWwPjWzL4UP4hwwc
 fB2x+FVkE/Hm5/CM0HA==
X-Proofpoint-GUID: j4PQMLQY3J2trANSp7XPDj6LSNNswTGk
X-Proofpoint-ORIG-GUID: j4PQMLQY3J2trANSp7XPDj6LSNNswTGk
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af5c8ed cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=MCZKxbAby-unP1KIBZoA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX4ku4VRdNtvAU
 uxOE9QVoWXf3gSSvtg24T4eA3Ha52D9Y5pwH9ElUciKvIDwZRCFBcUqs4nXEUdiKOFylaOK3G5G
 Xs2nCl1YgTcXbC0QQmiahJg/j91FxxQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_061054_339418_C7209469 
X-CRM114-Status: GOOD (  22.82  )
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

Add the core driver for the Qualcomm crypto engine. Its task is to bind
to the qce DT node, set up runtime PM for interconnect down-scaling and
register the auxiliary device using the crypto offloader driver.

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig    | 11 ++++++
 drivers/soc/qcom/Makefile   |  1 +
 drivers/soc/qcom/qce-core.c | 92 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 104 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 535c8619197b3e889e536da072ab89d3bb729804..67d54d5211ff21bae77cd8408fa47af630060949 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -121,6 +121,17 @@ config QCOM_PMIC_GLINK
 	  Say yes here to support USB-C and battery status on modern Qualcomm
 	  platforms.
 
+config QCOM_CRYPTO_CORE
+	tristate "Qualcomm Crypto Engine core driver"
+	depends on PM
+	select AUXILIARY_BUS
+	help
+	  Core driver for the Qualcomm Crypto Engine. Say yes here to enable
+	  the top-level driver that binds to the devicetree node representing
+	  the QCE, registers the sub-devices implementing actual QCE
+	  functionalities and sets up runtime PM allowing the interconnects to
+	  scale down.
+
 config QCOM_RAMP_CTRL
 	tristate "Qualcomm Ramp Controller driver"
 	help
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index bddd6f0a583673047067b1f0be725b8bb5d860de..9ef0f11d015852d1f599769074d761f1140c08e9 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
 obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
 CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
 obj-$(CONFIG_QCOM_QMI_TMD) += qmi_tmd.o
+obj-$(CONFIG_QCOM_CRYPTO_CORE)	+= qce-core.o
 obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
 qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
 obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
diff --git a/drivers/soc/qcom/qce-core.c b/drivers/soc/qcom/qce-core.c
new file mode 100644
index 0000000000000000000000000000000000000000..d51a791bb1a3682b7593928cd9857a1c00e60bbe
--- /dev/null
+++ b/drivers/soc/qcom/qce-core.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/device-id/of.h>
+#include <linux/err.h>
+#include <linux/interconnect.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#define QCE_DEFAULT_MEM_BANDWIDTH 393600
+
+static const char *const qce_core_aux_devs[] = { "crypto", NULL };
+
+static int qce_core_probe(struct platform_device *pdev)
+{
+	struct auxiliary_device *auxdev;
+	struct device *dev = &pdev->dev;
+	struct icc_path *mem_path;
+	const char *const *subdev;
+	int ret;
+
+	mem_path = devm_of_icc_get(&pdev->dev, "memory");
+	if (IS_ERR(mem_path))
+		return PTR_ERR(mem_path);
+
+	dev_set_drvdata(dev, mem_path);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	PM_RUNTIME_ACQUIRE(dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	for (subdev = qce_core_aux_devs; *subdev; subdev++) {
+		auxdev = __devm_auxiliary_device_create(dev, "qce", *subdev, NULL, 0);
+		if (IS_ERR(auxdev))
+			return PTR_ERR(auxdev);
+	}
+
+	return 0;
+}
+
+static int qce_core_runtime_suspend(struct device *dev)
+{
+	struct icc_path *mem_path = dev_get_drvdata(dev);
+
+	return icc_set_bw(mem_path, 0, 0);
+}
+
+static int qce_core_runtime_resume(struct device *dev)
+{
+	struct icc_path *mem_path = dev_get_drvdata(dev);
+
+	return icc_set_bw(mem_path, QCE_DEFAULT_MEM_BANDWIDTH,
+			  QCE_DEFAULT_MEM_BANDWIDTH);
+}
+
+static const struct dev_pm_ops qce_core_pm_ops = {
+	RUNTIME_PM_OPS(qce_core_runtime_suspend, qce_core_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
+static const struct of_device_id qce_core_of_match[] = {
+	{ .compatible = "qcom,crypto-v5.1" },
+	{ .compatible = "qcom,crypto-v5.4" },
+	{ .compatible = "qcom,qce" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qce_core_of_match);
+
+static struct platform_driver qce_core_driver = {
+	.probe = qce_core_probe,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = qce_core_of_match,
+		.pm = pm_ptr(&qce_core_pm_ops),
+	},
+};
+module_platform_driver(qce_core_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm crypto engine core driver");
+MODULE_ALIAS("platform:" KBUILD_MODNAME);
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");

-- 
2.47.3


