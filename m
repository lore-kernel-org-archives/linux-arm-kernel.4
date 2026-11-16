Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F35A606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2EVxL8vK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gQpSMm7u;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OM2ZW44z;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DRcO4jsy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7e3S2Spa1hdTnerFcKjC4xTuZBsfk1dfzwlUTvd3Upo=; b=2EVxL8vKo4d62a
	6Cr0EbET66XaPRzZNIAgKc1B3HXEXd9vPsWT+/3Z93DpBEy24gvRIZa1JAp0kbwjwgcpCMhiMOgsk
	j4dLtBb+J427eyazxXd4IIaZ4VgenVz81K08Ov38PbmFm8KkREL3UbXRiDcq3JIYpvkuEpBGfIVK+
	17Ew1G7SIE0ohjMbmbUEUdJRRhw99gwV3nbYlCZTE72/s88xElapf8CPhPnDn10/0dosIuNt8J8pc
	Seg2sTVkLx/XvXStQ/oBneFginUjwsn2+bhEbYi9mQR5IFiXji36xQadbydOm7hIWGfnRgiC7n3iQ
	3YkKQOD3OyaVap/vD7Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrLi-00000001Rdb-1Xf8;
	Mon, 16 Nov 2026 07:41:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrLe-00000001Rb6-1oZa
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Nov 2026 07:41:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7e3S2Spa1hdTnerFcKjC4xTuZBsfk1dfzwlUTvd3Upo=; b=gQpSMm7uKVsZurol25+Ce0LYwo
	RgGc2RssjMrZBp/IVkBWm9bBSQ3NDs8tVlHRRYBqa1lExOrYHnqWAlc/qHKOs+mv8GBaLEJX0TJrs
	MXS8zSWCMmP8lNCMivCtEYjieN4l4RrrrNpB+pd8GyoVYVyx6nKWPXc7BbrTZYFKX7n8FvTQxTA1C
	cSXqV0wUCUkRnfjDDhmHMAwrt8v8T9t0V+gFGnmE4QRVpSC0mOgBQs5lgMxnAfpoJPTD7Jde8LKwJ
	GKNH1zJWfxR9XXdmxal2KXjR/nTwhmmcJlVCVa29fiwACYf25AHdlpilCWUw4g9iT3eOeFKzSkwfu
	1xWrHUbw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrLa-0000000DT3s-2rMS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:41:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7et5R524918
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 07:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7e3S2Spa1hd
	TnerFcKjC4xTuZBsfk1dfzwlUTvd3Upo=; b=OM2ZW44zmTM6inS3+gnsaV2ArWg
	vK2uLf4fXU/YnTTZjwKt9+VRyWCgB5pXvXEPM1ZpkaVuLo1AdfyYLNeraPnHFY+Z
	UR+j2avRLIt5BFe1OLlWf6kXtv24KVMivvBvKZovQ1zDXqd2eQa9K5iV1FxOkB9i
	pzWjHVP2Tg829Ae2WsCAzZR54ZQbgIR7xZeFdqxm+c2s9R9kXP8bQYcHGmyW7IFc
	blvbsDFQYkpniwHpFLHf9URcff3hvc+NYQBtV4QlS8y10ELb0teJW3lHirsdE8N+
	IZOoq6xo7w0FkzVk8dPV10bBRM+ZUZw3VVA8facinFJVMJLvhN8HURYgYww==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqngaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 07:41:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so3840787eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 23:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794814903; x=1795419703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7e3S2Spa1hdTnerFcKjC4xTuZBsfk1dfzwlUTvd3Upo=;
        b=DRcO4jsy/5BHFsyzwdJN/Grop4ZbxpKLeANyuOSrrG6l9Ad+Olx/M1G6HxheQBqKVw
         Cz/wTXEobf4gyIoRbT6dV0S21GNdzhkyYZhHFH/6v518MiFUP875GyyOj7p+dheNlaMQ
         w1TweKDcIsX5AGWTzx7+FutICgPfQdwtMHjuu9T9+7RdOhFlvrF0ZV440Nb+4GwSWzvc
         QepJsZkO/J2+zanIJlc/j62cqVYovw4fFLtT6otlP+KPTcxQtubZ9Ahx3PfkBHWv1GvZ
         c75aizsveS4whUtErbKS6yyEUwqkqU2JSsNOLI0bMt0u5Oe9zsNhfoSRGhOekcvWwqc9
         mpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814903; x=1795419703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7e3S2Spa1hdTnerFcKjC4xTuZBsfk1dfzwlUTvd3Upo=;
        b=z6ZdWpBJuDjatvLzblmRaRBDbmulqcj/ER4KbA2ERZTmxjz10k2YRJejHikceviKyy
         03yGiuN7a2wep/5KrNEbK3JcOQtoAnnVC45A7Y60OWTJU0RleT79DNI2c3IyXy3GBTsU
         Qxk2V+SvQd7+climqYTUPcfCXKiHaBK5msWw6Bwf97X5fdkhgjLCzk/2826YFb9fY5KR
         BBxu9xDDbp9Baa2oiTrYwqahNrQaSMtK8d1xvrRsJuxrvqW95IkjzqGaURFANoq5MLyT
         YDCmH3gRxJpp5wkJWkmyB1fm8wSIL/1ujElR1PNb3WyZxZSSWcJIHWy3u9s2xWU8HYM3
         tD/Q==
X-Forwarded-Encrypted: i=1; AL+hErHly7zzPk3Am4lVMUM9SXAhL/VrhA2q0R95NOf6nF1UsPvfdXUOG2Sv5pQAZFPvSK6VLHptYxSLvhmo+/2OtPs8@lists.infradead.org
X-Gm-Message-State: APuU4Z9Od24VADkf4QgVU7tB+6Mge5wVUwGL3w2vicYYRWg3U8u6LFnO
	hGblGG25zkUY2pZk54ZA0lxnbfnZayTSHbseH12PWF0N5Wr9pe4ec+siu/CsrMAxIaZBl6NGiAd
	2c1xSHTvLtRvF125e1ro8QN/nbdh9csrxVNsldiz1wP6v6gKkjUXoa1iznUGWTzNrTu6kZggRc3
	Dc0w==
X-Gm-Gg: AYBFou2/1jkpFiMTdbvPqiTuJ+3S1byE5hu84QeATSuXpSVSsqJRAdE/6FbtIC/SniV
	IEzYBdGeh450pkx1m7vyPMK2xsLThGtCVBDuCOVF2dW7Ap4r5Ak19KxjoK8BjMR75EtinTwejAe
	LP07QRuHcvVDm4YxgolQDig5TglcYlT6ht589/QaZrKu0/qPIh4RCpgx8u88A2TX4XpZ591smPR
	qNKQSU/Y1OBN9n4Ximq8oQcWJpBjtbDuw3MtG5BUZQzDrR0DD3tamgBU5eo/Qvb99ULNvRgz9vc
	JDehpvmkNkMXOeql+0qt72uOPTGluC6k3lAFYvvx77oNAEtKl2LP6GlTMViIXs4y/VGpoGWQzAG
	oW6K8nOO56v3QXeAWNLVX32vTxaeb50x61of9Y1w4n7oVAAvWMVuNhA42smVDQ5b4g4f/EkyyPl
	82WOfkXR7+67MC0ll0hxiwfbmStT3s9bUbUA==
X-Received: by 2002:a05:693c:4153:10b0:37b:e40:397e with SMTP id 5a478bee46e88-37b0e403d73mr7556476eec.14.1794814903159;
        Sun, 15 Nov 2026 23:41:43 -0800 (PST)
X-Received: by 2002:a05:693c:4153:10b0:37b:e40:397e with SMTP id 5a478bee46e88-37b0e403d73mr7556455eec.14.1794814902559;
        Sun, 15 Nov 2026 23:41:42 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm52137536eec.25.2026.11.15.23.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:41:42 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v18 3/8] qcom-tgu: Add TGU driver
Date: Mon, 16 Nov 2026 15:41:13 +0800
Message-Id: <20261116074118.822731-4-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
References: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6afab3b8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=Rd-eziGjFw8r9s-5bI8A:9
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfXxJdccoXeEnrk
 0wnxqvL6YPMf0ZnMXslwjOnRyB80YACc6jmwLR/dCP6DUlf1rBmUfr66U5R0gHCt7JWeMxbMnDM
 MNgqIsxxNl1+Qa694FCPxGl/taMh1uw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX5RFXFyrgq3sO
 fiX/zaMj4mhyxE7ONm8+FWr72eo68jmnL40dd4Vu9eyJvCtakkrHcun1iOSNuM8lWn80gcvgc8G
 L3YBQQehheAhvzpmVaSPtpiRU5k8tvOfvVhz9yY7OhwgJkvbtxKDyleLKS7/aDt6YaaWeUWK22j
 ZXBRmqK7sHBg2T6fm/SUNr/tV22h8h/LG8Nx9MhP9MnIgF9DFIVw4SYRwX8vRztLQ5VOFkUNUNw
 NXozYY/YNKWsCzTLOZinR18dgIE6lDEaEcCKKOUTD+ldQmMlyD2wWLBs9+66krXtAOPVdRGtb9l
 TM5QW9L7/S68/Kx/fkm4NXYQDXRRHgzjIh6yO3bIZLcJDBHDnX/ob/F0vJDXNfGYZq5UGlfhdUg
 5HmYfByagDkwebVescBteYf8L2nZoebgpSRttfeAHtgrRx1XxM41jR5zFmyVH7rYV4xfB2uGd+H
 ONkOKFkw5RucgHNnohg==
X-Proofpoint-GUID: Ve8jRIz89yjoUorn3qOWi41wVGWxcAI1
X-Proofpoint-ORIG-GUID: Ve8jRIz89yjoUorn3qOWi41wVGWxcAI1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_074151_054303_5F63C6BC 
X-CRM114-Status: GOOD (  30.53  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add driver to support device TGU (Trigger Generation Unit).
TGU is a Data Engine which can be utilized to sense a plurality of
signals and create a trigger into the CTI or generate interrupts to
processors. Add probe/enable/disable functions for tgu.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
 MAINTAINERS                                   |  11 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/qcom/Kconfig                |  20 ++
 drivers/hwtracing/qcom/Makefile               |   3 +
 drivers/hwtracing/qcom/tgu.c                  | 193 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  31 +++
 8 files changed, 270 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
 create mode 100644 drivers/hwtracing/qcom/Kconfig
 create mode 100644 drivers/hwtracing/qcom/Makefile
 create mode 100644 drivers/hwtracing/qcom/tgu.c
 create mode 100644 drivers/hwtracing/qcom/tgu.h

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
new file mode 100644
index 000000000000..798a0e51e27a
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/amba/devices/<tgu-name>/enable
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the enable/disable status of TGU
+		Accepts only one of the 2 values -  0 or 1.
+		0 : disable TGU.
+		1 : enable TGU.
diff --git a/MAINTAINERS b/MAINTAINERS
index ccbcdc0799b9..8c49e2a69b6e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23271,6 +23271,17 @@ S:	Maintained
 F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
+QUALCOMM HARDWARE TRACING DRIVER
+M:	Songwei Chai <songwei.chai@oss.qualcomm.com>
+M:	Jie Gan <jie.gan@oss.qualcomm.com>
+M:	Suzuki K Poulose <suzuki.poulose@arm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git
+F:	Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+F:	Documentation/devicetree/bindings/arm/qcom,tgu.yaml
+F:	drivers/hwtracing/qcom/
+
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
diff --git a/drivers/Makefile b/drivers/Makefile
index 0841ea851847..f37edcf34e0d 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -176,6 +176,7 @@ obj-$(CONFIG_RAS)		+= ras/
 obj-$(CONFIG_USB4)		+= thunderbolt/
 obj-$(CONFIG_CORESIGHT)		+= hwtracing/coresight/
 obj-y				+= hwtracing/intel_th/
+obj-$(CONFIG_QCOM_TGU)		+= hwtracing/qcom/
 obj-$(CONFIG_STM)		+= hwtracing/stm/
 obj-$(CONFIG_HISI_PTT)		+= hwtracing/ptt/
 obj-y				+= android/
diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
index 911ee977103c..8a640218eed8 100644
--- a/drivers/hwtracing/Kconfig
+++ b/drivers/hwtracing/Kconfig
@@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
 
 source "drivers/hwtracing/ptt/Kconfig"
 
+source "drivers/hwtracing/qcom/Kconfig"
+
 endmenu
diff --git a/drivers/hwtracing/qcom/Kconfig b/drivers/hwtracing/qcom/Kconfig
new file mode 100644
index 000000000000..5c94c75ffa39
--- /dev/null
+++ b/drivers/hwtracing/qcom/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# QCOM specific hwtracing drivers
+#
+menu "Qualcomm specific hwtracing drivers"
+
+config QCOM_TGU
+	tristate "QCOM Trigger Generation Unit driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on ARM_AMBA
+	help
+	  This driver provides support for Trigger Generation Unit that is
+	  used to detect patterns or sequences on a given set of signals.
+	  TGU is used to monitor a particular bus within a given region to
+	  detect illegal transaction sequences or slave responses. It is also
+	  used to monitor a data stream to detect protocol violations and to
+	  provide a trigger point for centering data around a specific event
+	  within the trace data buffer.
+
+endmenu
diff --git a/drivers/hwtracing/qcom/Makefile b/drivers/hwtracing/qcom/Makefile
new file mode 100644
index 000000000000..5a0a868c1ea0
--- /dev/null
+++ b/drivers/hwtracing/qcom/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_QCOM_TGU) += tgu.o
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
new file mode 100644
index 000000000000..5bae46db4f8c
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/amba/bus.h>
+#include <linux/coresight.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
+
+#include "tgu.h"
+
+static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+{
+	CS_UNLOCK(drvdata->base);
+	/* Enable TGU to program the triggers */
+	writel(1, drvdata->base + TGU_CONTROL);
+	CS_LOCK(drvdata->base);
+}
+
+static void tgu_enable(struct tgu_drvdata *drvdata)
+{
+	tgu_write_all_hw_regs(drvdata);
+	drvdata->enabled = true;
+}
+
+static void tgu_disable(struct tgu_drvdata *drvdata)
+{
+	CS_UNLOCK(drvdata->base);
+	writel(0, drvdata->base + TGU_CONTROL);
+	CS_LOCK(drvdata->base);
+
+	drvdata->enabled = false;
+}
+
+static ssize_t tgu_enable_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	bool enabled;
+
+	scoped_guard(mutex, &drvdata->lock)
+		enabled = drvdata->enabled;
+
+	return sysfs_emit(buf, "%d\n", enabled);
+}
+
+/* tgu_enable_store - Enable or disable the Trigger Generation Unit (TGU). */
+static ssize_t tgu_enable_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf,
+				size_t size)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret || val > 1)
+		return -EINVAL;
+
+	/*
+	 * Hold the mutex across the whole check-and-act sequence: the check of
+	 * drvdata->enabled, the PM runtime reference counting and the state
+	 * update must be atomic, otherwise concurrent writers could each
+	 * imbalance the PM runtime usage counter.
+	 */
+	guard(mutex)(&drvdata->lock);
+
+	if (val) {
+		if (drvdata->enabled)
+			return -EBUSY;
+
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
+
+		tgu_enable(drvdata);
+	} else {
+		if (!drvdata->enabled)
+			return -EINVAL;
+
+		tgu_disable(drvdata);
+		pm_runtime_put(dev);
+	}
+
+	return size;
+}
+static DEVICE_ATTR(enable, 0644, tgu_enable_show, tgu_enable_store);
+
+static struct attribute *tgu_common_attrs[] = {
+	&dev_attr_enable.attr,
+	NULL,
+};
+
+static const struct attribute_group tgu_common_grp = {
+	.attrs = tgu_common_attrs,
+};
+
+static const struct attribute_group *tgu_attr_groups[] = {
+	&tgu_common_grp,
+	NULL,
+};
+
+static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct tgu_drvdata *drvdata;
+	int ret;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->dev = &adev->dev;
+	dev_set_drvdata(dev, drvdata);
+
+	drvdata->base = devm_ioremap_resource(dev, &adev->res);
+	if (IS_ERR(drvdata->base))
+		return PTR_ERR(drvdata->base);
+
+	ret = devm_mutex_init(dev, &drvdata->lock);
+	if (ret)
+		return ret;
+
+	drvdata->enabled = false;
+
+	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
+	if (ret) {
+		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
+		return ret;
+	}
+
+	pm_runtime_put(&adev->dev);
+
+	return 0;
+}
+
+static void tgu_remove(struct amba_device *adev)
+{
+	struct device *dev = &adev->dev;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+
+	sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
+
+	/*
+	 * If the device is still enabled through sysfs, disable the hardware
+	 * and drop the PM runtime reference taken in tgu_enable_store() so the
+	 * usage counter stays balanced. Use the synchronous put: the driver core
+	 * disables runtime PM right after ->remove() returns, and the barrier in
+	 * pm_runtime_disable() would cancel a still-queued async idle/suspend,
+	 * leaving the runtime-PM state inconsistent.
+	 */
+	scoped_guard(mutex, &drvdata->lock) {
+		if (drvdata->enabled) {
+			tgu_disable(drvdata);
+			pm_runtime_put_sync(dev);
+		}
+	}
+}
+
+static const struct amba_id tgu_ids[] = {
+	{
+		.id = 0x000f0e00,
+		.mask = 0x000fffff,
+	},
+	{ 0, 0, NULL },
+};
+
+MODULE_DEVICE_TABLE(amba, tgu_ids);
+
+static struct amba_driver tgu_driver = {
+	.drv = {
+		.name = "qcom-tgu",
+		.suppress_bind_attrs = true,
+	},
+	.probe = tgu_probe,
+	.remove = tgu_remove,
+	.id_table = tgu_ids,
+};
+
+module_amba_driver(tgu_driver);
+
+MODULE_AUTHOR("Songwei Chai <songwei.chai@oss.qualcomm.com>");
+MODULE_AUTHOR("Jinlong Mao <jinlong.mao@oss.qualcomm.com>");
+MODULE_DESCRIPTION("Qualcomm Trigger Generation Unit driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
new file mode 100644
index 000000000000..c6426b4e3617
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _QCOM_TGU_H
+#define _QCOM_TGU_H
+
+/* Register addresses */
+#define TGU_CONTROL		0x0000
+
+/**
+ * struct tgu_drvdata - Data structure for a TGU (Trigger Generation Unit)
+ * @base: Memory-mapped base address of the TGU device
+ * @dev: Pointer to the associated device structure
+ * @lock: Mutex serialising enable/disable and the associated PM runtime
+ *        reference counting against concurrent sysfs access
+ * @enabled: Flag indicating whether the TGU device is enabled
+ *
+ * This structure defines the data associated with a TGU device,
+ * including its base address, device pointer, the lock serialising
+ * enable/disable, and the enable status.
+ */
+struct tgu_drvdata {
+	void __iomem *base;
+	struct device *dev;
+	struct mutex lock;
+	bool enabled;
+};
+
+#endif
-- 
2.34.1


