Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C903C606A6CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AYbaCLRl;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bunohDY2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wu9oBMd9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CA60jbgAbACA9EQ8iNp/ZAkGi8ehCtPshC0JxohEJ30=; b=AYbaCLRl3bh+XV
	v3YStKoitdCjfXErTWgOCzEbk+DHy7LU+sl1ggskD/mzDlOTiPHvQJHTCLs6Rek1/h8FqS0qXqnQU
	cqmLI0S/T0iINfDGcGVDIEmS9gyVZMAoWf1qKkNAruooxPiixmm6MM5R7UGqKG0cduq3AQgjlw4wz
	aOl17O1B6mzOjxaol0ulBFxQO79PqOpXiy5ktmac910AC+f83gQTb9mSJSDsjpCyDJoHvfiAbTsWT
	51w+bEwrXrZwIXMAKp1OiPK3g2n1OUkDd8yzxpT6bz+SaZT5Ea8kLy0zQsKRVhJswTfHHD0Rw1X/R
	Nr7Ye5JBYeTXJjCo+QWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUOC-0000000G6UU-2XdO;
	Fri, 20 Nov 2026 19:35:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUO7-0000000G6Rw-13Xc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:35:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEfSWc048804
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 19:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CA60jbgAbACA9EQ8iNp/ZAkGi8ehCtPshC0JxohEJ30=; b=bunohDY2nP7QGQt8
	MdN7UOuaBn6wh93fUl7fK2J8gUn5UxlSie0LypcNEIB3aELjmGw19tpj1eQyw7H6
	KmXdTYtYTc2KTgSFYatJTypCvN6nWqjj6kAXVX8Y2crkkm/51nveBlE7mVP7vb1X
	otwZLyLmCBd5WBF/yPNeZO/rvRKO+vO3iRTIi51veWljFmO8NPlx7cIacKsO9ecY
	AfzslodA1dKqDChu6LGsFe4xj8wBKR4bV/iWarXx+lBbwM5L8mM0mpdmMM0JjsQJ
	C1qkrgVIcKkGhaiyP/IPb0wKbdVQDut41ka+9GRpqfoCmfdX2stBen0YrESTYXUI
	gHaqQA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4j62y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 19:35:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55d2c5f10ddso26315171cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795203310; x=1795808110; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CA60jbgAbACA9EQ8iNp/ZAkGi8ehCtPshC0JxohEJ30=;
        b=Wu9oBMd9YuSHSUg2k5stGuxAIG0iTXPDUAJsJ3mEuLg3BH8UeVZ83klI4crkDLc/JF
         0/l6Mj4RHpRmzFyNgItLSE2P1p+pDujoFSaqJrFG/ta5aEu6/0j9Ed4kmSnp8e7/XXKe
         ulTF+T7dowBWOUC/4IaCTpPLhbCelsQk8Ie4pgMSNpfXp1KikdrLb3o377uP3ciX2pww
         g71NJo5ziobgIPcpWzqV8/oTg8MSiWb1uJtvl4YV/GOTnmTgRu97Xuh3uNrPD8MCak9q
         vcNmefeYbwpBgL+yM94H6m8aKtrrcR/+iOVhYUgzHT8Z07SjXBX9/HcYgT9hLcldqMca
         rGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203310; x=1795808110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CA60jbgAbACA9EQ8iNp/ZAkGi8ehCtPshC0JxohEJ30=;
        b=rkHd+LYcRpy7KVfGWnhVgnTdAj2KmJzc/yvcPUFaACnPziigvKw1bEoTLM0kZ+qA3x
         G5nWrsB5knQtK7zj3ogyjFnvQG33OA5ms0iNCE1+1UCuiWfnwPdTKRYANiLVn1+yMcmK
         6a8ywrrscfg42Ns8RLyA8/Lom1VAuBNJrG2gLCQmqsg9pANSIHZij+K2z41oAN44mJiY
         n+r+x9xFatTbx+xQMyo5BIA5Xt1CaeDHto3ZV/mtcnKSCp0SZ9qK4qD1j8DqubsXztnC
         iAbILDvduyGZz5Jf8kfHsk+b6Ueu6RhnvyLW0qqQQwVg3ixYq08HPfEX6l+Zk7vS3QcO
         IE/Q==
X-Forwarded-Encrypted: i=1; AL+hErHACio/CPLS1Rb5ba01aJ+EZHsl7c5FE7ho73bpRHzeRuh70glLd+Kz1QkkwNeIq0Ikvh0TZkabu4FK75G2SX+u@lists.infradead.org
X-Gm-Message-State: APuU4Z/ZJuW4n0jbwzPW2UlGcWh34rgsrCG24gsHW8VzTlzDbBNRpAES
	sPiBjgo3ufVBpTg0vLccAH6Z8QbdUMSd57IGFMF5paiShLA4Dk4LwSxoeDv50Q4wEjS1VBFWub+
	KktJpBAURvwj9Bz/0Fz7bVBzId2thQ3zsvTKkOtVoFHofRsX2Sb3X9K0TaeOWXJB2tgGjH7Lb8K
	wFog==
X-Gm-Gg: AYBFou0v8tQq2CT0EcjvTf29TzdhJXAjwd/71/2idw3B4PaVFuYjBSnjv3sWvK9b2Ye
	zQUdYzvqgn6i7cPdUR3e75VpLPHQmqLsTna9FXPqbd3uTqbGcJhJg0/p+edQWWBMvA3RMZg/oyi
	oABflsQQ6b7XAA9uM90NgemotKkUpOUSFalxCGV50T7pEa52xTYsPoiSxe68KA/CTEdlHxZKSK4
	l24E4F/GVf4k1TVFNuVatoe3aVMeBTx9qb8yXQqnluvccZboBe9iECMMLUnADdEUquQn8ITecnd
	I+OGTnq3A3Cz15nwR7Ze5eO/6cPj+Y1IQIaxLrPNV3/QYlLaYHbfUsbOhJ3N3ErAwcUs/zCrCct
	jogR8vkzUyXoW9ASLPEOrooGsaCBpqSD5unw9iS1klHFDinP56Ez2pRB1dmFgVTX/6djiNdEnYC
	6o
X-Received: by 2002:ac8:5e12:0:b0:55d:34ae:98d with SMTP id d75a77b69052e-55d769332b5mr82070651cf.10.1795203309369;
        Fri, 20 Nov 2026 11:35:09 -0800 (PST)
X-Received: by 2002:ac8:5e12:0:b0:55d:34ae:98d with SMTP id d75a77b69052e-55d769332b5mr82070351cf.10.1795203308921;
        Fri, 20 Nov 2026 11:35:08 -0800 (PST)
Received: from brgl-qcom.local ([62.245.128.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm6806343f8f.20.2026.11.20.11.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:35:07 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 20:34:55 +0100
Subject: [PATCH v12 2/4] soc: qcom: add core driver for the Qualcomm Crypto
 Engine
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-qce-fix-self-tests-v12-2-b5a2a44bc5ae@oss.qualcomm.com>
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
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4974;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=h8wi3gHoBcPSHO6wVsk4xV1kjaXiDYSNLUgf+OIBeBY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAKDlgNZLwclqLDXVFh4rE36Y4UBNK6xtXQ2Ur
 9pXyKFIc+eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawCg5QAKCRAFnS7L/zaE
 w4jkEACINxuQoQ84aNZnezFZ+3ACAHlC1PZlk64EgwmcmPiKwsx7tuGA2iwlevgoP7nKKsQXqDK
 MKvkQ8UK7SeYMgitOufImx1yHB1/2O4hPfdXwYiai8bX1rH/dnoUD9pzIevaMl2kMvXX5vweBFt
 c+9ehiQid6AxrSnu0VEIvJYUvMBVP6+jboR7pgNZvm+bNdg8lF4D82Bok2gltGH6HgnFVxW428I
 gWmQbs3G0U2Wie4I6NhUIeExzKS2NOjlMRVoHgApS68npU4Ypfh5CzLJ4zGoU3tLI5LLiOw1pMO
 lisfnGTUMaXIwpbCeKg23pTFLsA2ovJLiiPIz6zqyePeaqJjNg0JAtrjdLOJP0XA6U2hyQPVIEN
 V9R4CTp9hTReJsMEMwCbv79uSBa5INLHWsrMvv4sVMvemsiFUQlaEE7jp6nXJxdoeoxLv/kfqXo
 is3R2QJhMd75OPuwox3XCKyve64bt5X3MF7SmSCZU9DF6OpcMXcCWEkGUPMHkKB5D4XmPKSoZJ3
 J/bqJCPk1BVqc3HbRYUqeZ9NtoLugpjIakHnhDys0jeRmr405rwl0zsbRWmoD2crpzvSi4O7Twa
 cIVX6xAZ2W+rMFEiuL8gl13eQ612hW9rM5i0STWmH9KNjenJXqEb9GV59hZCfwfN3/isR3Fyd4J
 wcmsGJ69ZwnY4Aw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: cQeEfavKqMZYtGgpGzOJA_7G7_3CqeIY
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b00a0ee cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=y0NJeVxnVzJs6a3GlOz7RQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=MCZKxbAby-unP1KIBZoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfX6hQjSLnmO3W4
 4JMEEuQ9++o+KQELXbii7dEYuZ2RHQb5QTc6/U0XBDCfPm7OmPlVAr3EDzG5hc1K3fBZmXhZl9a
 csX6+ifOdutMRX/rdPYrQh+g7Y7otRc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfX20MLIKl5zMzG
 ujz+bjB+JXz1jCqF//6f+TXkFSZj/n1pMzYRdLX8QZQvSzLEEDpCISwzxaw+LpEQFCzZOmUV12A
 xf0bSs1tDtygZ3x+lewHdOLRBQCOH6gtFsHku67n6H+4sEfM5i0s3vMXXWi+zfvrqsAwX8eIQUG
 I0qDZKLQygorPpWAjHdDHqa8hw8WwFq2D21TNPmku1ImVLj+goBljHCI7aLiqw5OsmvH1ZHJcTO
 BX18/NoNMdE9lQeRrVfu/26RUhGlMW34fcePZhaK8wTt47QfBhLCbInnhtlbRbyWDoYxlu30JeV
 ogOodACfq9wqVZzIbLgzLT3WpLsE58zA58JBUeJjnU4OaxntWPKidpDzo3DUwn0Ns9qGFXnLRNs
 pz4ozFT+dWb56VkdC+Z8vj3vs1RPLk5l2P9pDmCmh/DSC8gHWsz8XARbe1NoVKC1X+Qns5C89x9
 Qd5+Iz3qHtPjIgM8Zvg==
X-Proofpoint-GUID: cQeEfavKqMZYtGgpGzOJA_7G7_3CqeIY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_113511_516676_E6665640 
X-CRM114-Status: GOOD (  22.64  )
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
index 0000000000000000000000000000000000000000..1f249a22e8366e8dac3cb9847f5f85e7f2144225
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
+		if (!auxdev)
+			return -ENOMEM;
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


