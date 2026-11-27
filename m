Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9406B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sFm2qZVi;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O7E+Q1pL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sc0K9F1v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G+/mPIAlAmNu65ne7MgAhXOg6Anmd5RRFn5vcEzFy+E=; b=sFm2qZVisiECay
	NuFrR7AUEZopdo/3x/qypEdg5gPD0TKl1GywyTTXstl73UasVj3D8WtSz1On6dJDIR05ST9YOG8PM
	pdCxA0uZXAVQAGURbjnOwDr78eRDBP0mBPqUKVGgnIzAjeTMhlSIUFM3kwf0bHF8WTCkMjatqf2RY
	Ri5JqNz9hhD8uNgNlBrXD+agVWVmHiuinTJovAn/F1KPNde7pIkloxnmklc0lsaNXZZnPC7aE2KIg
	/+iRbYgv75QUpccx1P1FqATJ4kn+mDivK1YXK24HuJ25F4EgGKZ2dcyvjNcwZy6MuQOKUrO0oKkSn
	AmISsXWuJnYClnnNVXUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxBv-0000000Gc5l-2Uki;
	Fri, 27 Nov 2026 14:44:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxBs-0000000Gc4t-3YpA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:44:46 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1PHx1462702
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G+/mPIAlAmNu65ne7MgAhXOg6Anmd5RRFn5vcEzFy+E=; b=O7E+Q1pLySSzaAPl
	9lJy5CK6cZMgMC4XZYlp5dOmD5x7bEmhBRO50n6zO8njZqgn5kbpfukpQaGai9IU
	b7MbnkuFO/K1MdySqxX794+8oUwvfknkIJCXPoQshJfGP0l3I7DH9eVxGFeG6oML
	jHrGjccLL9+whIidtIjb0KRbA/t8lcyfw/mGWEXBbXW4P8XOL7bF4MLYkQotye40
	h0Ur+dvq929u295mNm5ZfBo7TynZ+2a3LQAWyR+ZHIZEORpvUpXhwnrn1TduytMU
	J0bd3aZoLtZHJ9emPgsBaq9APHQAAeRpev3mwCn7GeRMhkn8RuZCZKCo4yb6vI8x
	4ojPJQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqmc0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:27:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f0381f07a0so82271115ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 06:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789641; x=1796394441; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+/mPIAlAmNu65ne7MgAhXOg6Anmd5RRFn5vcEzFy+E=;
        b=Sc0K9F1vYaU9z7gZpeZf4Ema/lpUi7HBeU34J/u6586SHNYwlUrdG2zxDZicZ587WJ
         Mzx5UC9x4Ai6po5b0WvzJIFQbd9dinQ7bUCcZthyzL5YPbvaExGIlT/kR1EqLfoX3vwu
         mEYTmgf1ZOBnW8MT6p/oXs4KERcLy+/u8tINYCPpuVDApF1Hpg1rQmr2LZYiMfz7H3GE
         toaXHQqzXO51Z59d1iY/OwmQ6HT7ZaJS71j1vwEaTxhyMIIAwgLNkp5HlZRcQdXySQ5w
         Tf17mfkD7DO7p5xO35sjcdMW7u1SRxCorffDuYYDB3ndo49NfxN7POOw5yAYNWp51lxb
         o6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789641; x=1796394441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G+/mPIAlAmNu65ne7MgAhXOg6Anmd5RRFn5vcEzFy+E=;
        b=AmuGzYGcZPIzGY085wrG04zDTrKL3bnKqymn1mekuTLSZQ8gLb6Sp4/3URrmyljxZx
         J+IDUTIBVuAoOQBNQErRsWk5pTe71CAW5YHX+Ze1/NqwtQww13Nd8ap7uc3Y6TPv2P+C
         RmRhIvkOPE9Ul8xmMPo1AwTEU2AgcuPZy0e151qDkSxTSDxVG5nRVAQ9RjuaPTywdjHR
         9w9D7T6Ox7/GVZA3ew5Sgtw+VGhwGrIaLa06CE2wah2tidZyIie+68WoEWCB5+8W4JTu
         dQg4S1WzBwppU0YfH2lBp3eAyXVaC9RTc/7Lhaj3csyuVCKj4ehWgfoDbFY2PDAICr8G
         FroA==
X-Forwarded-Encrypted: i=1; AL+hErGJwqzDuNJ08LQiXNWDbTX92zA2/TN1JTy5e/f5k9lichbKMxcs/rni5l+CJzSZmfv8dyORlLtrgZGzYmjtd2uP@lists.infradead.org
X-Gm-Message-State: APuU4Z9ETVtOH7X4pjpDO01Qqwbakow1Jyz3FS8NYBjqjy832t9I6AWg
	+oan0KhV/lzhUg9KZ+Z1UznyJLls0Kpw/ZoWvGbtHdWsUllx8RqjHYi5Uc24ciiT9gN+Z57Ka+u
	33TnCxJX93Dy6M2DmTDWJj1I9HjU/pvt6fPT22l51y0wmOWC0Ha3ZHfwGSYGx7hvgFdwnXZt6Dv
	TmbQ==
X-Gm-Gg: AZFdTZdHKY8OyYMm3K0aLq93sC/4nxilYzYlqlsqexSI37qcSV3/VI53h+5MDPNW2Gq
	jnl2TDYI/V4hwmdc9zUvmyJ4he8Wp2M7CAM9X6ZhUwd6ZzSHoyWSLq+RxDDzSNzWYzZjhTr74Hd
	beKEBDNbS0ZBe/h3hi3ynBeu5aWPo9DKXFbZ2XPWM6t/Q1Xlxnef/U0bWPYVyXZUM/+etpV9ZGu
	z1fjTIZ1E7eJpGOH2cQqeaDycYpzEtey68tGMd3shLhSmBBAdEym1Vd6Uwwx8QLK8h45QpSGn0P
	kNg18O/kqmWUrZlbGYHMjMAPnTudrazIHUXfNYQF8AGaAts/I2K8Hjv5yu+ORHCA4QJHKy7nY8v
	Kt2gSS/jlQnexBVWubaq3n2m3quwvJeCkwLqSuZrqa7viRsRVeDr5qnaBgolJCfsmVfyXqh8tNI
	1o1e9x5Vn3LQ==
X-Received: by 2002:a17:902:f708:b0:2ed:1fba:e5eb with SMTP id d9443c01a7336-2f03f1e849emr181429205ad.27.1795789640748;
        Fri, 27 Nov 2026 06:27:20 -0800 (PST)
X-Received: by 2002:a17:902:f708:b0:2ed:1fba:e5eb with SMTP id d9443c01a7336-2f03f1e849emr181428765ad.27.1795789640266;
        Fri, 27 Nov 2026 06:27:20 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:27:19 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:56:54 +0530
Subject: [PATCH v28 01/10] power: reset: reboot-mode: Support up to 3 magic
 values per mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-1-da05a33b08d8@oss.qualcomm.com>
References: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
In-Reply-To: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=4639;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=s+/OOgO8ouYEbBmn5eaEqRu0J/fLnxD34GTBaKHGJJQ=;
 b=Zr3zY7l6pVS0J3mfCCWbdt2hj4OwyspykPKTI4tmwiwhAVmXyOemVxAeR8jcXBr5Lj4wg5+eW
 yeXhKf7gCd0Cy7e4MK0qzeMXTZNGVORK6M88L3P1kURcn6Bgw7H0YLN
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-GUID: O3c6KAtFltqr17ZrlAKp--TW8yWbJLhg
X-Proofpoint-ORIG-GUID: O3c6KAtFltqr17ZrlAKp--TW8yWbJLhg
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b099349 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=_usNffLPL2KliZ4tEdwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXzKZclCLLRCDq
 7jHAaIE1EVXuwIV+FboY5dsinvTL0DysteRYfHxLW5bFFl51wwh5/HnRRq9srHxP5cD8ME7CZlF
 QE2CU5NCK4C/i3s8jvZQ7yribQDhYNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX0fckeQgtcolO
 J5Y0s5Z0loOIusJkM3NRoIaJD2+CvN9YJ2Ln35nd4tyZQK5uUTBsyPQKvRu9nMivtE2x1E5NsI1
 2WHnRjVjOtkFlFZazBbOH0CvMKnaww3WgL2RY/HY/1N4hda+sGXyJDS2tG3p80u4MdVytyIrNNL
 RKpwod16ue+3rz4efSJLTB84DqbckR7WzLJ/FReD1IutWgTHOa4pjK/HeymPs787F9A6XnKosJp
 QH9+eRkZjTX8kzCIhFW6LxCkoiCP1L8cV0Z7h1yiWe/BQRIZ13VWgWC/L0UrEQbcxeLUuGbV+vf
 W5WfamK55d2ZrOZ/v1AtS0XvTzRVstN3up2uNpoV6gmjQDPlez9OOmk7RDul6ebcd9tSCue65FY
 6I8HfYvEf+fgpgcX+u79MLGFMoFj9seixpDEhaC2iwDbE2ttpuk4sSJ2JzIXzZem9p89WNR9z6R
 mhmt0KC0ZPGPSAAd+wQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_064444_949784_8C0D8B0C 
X-CRM114-Status: GOOD (  22.93  )
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

ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
cookie as arguments. This cannot be implemented via the reboot-mode
framework, which supports a single 32-bit argument as magic value.

Extend the reboot-mode framework to support up to three 32-bit arguments
as magic, per reboot-mode.

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 46 +++++++++++++++++++++++++++------------
 include/linux/reboot-mode.h       |  3 +++
 2 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 3611bed341e14..328fa37598df3 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -20,7 +20,8 @@
 
 struct mode_info {
 	const char *mode;
-	u32 magic;
+	u32 magic[3];
+	u32 count;
 	struct list_head list;
 };
 
@@ -72,8 +73,7 @@ static const struct class reboot_mode_class = {
 	.dev_groups = reboot_mode_groups,
 };
 
-static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
-					  const char *cmd)
+static struct mode_info *get_reboot_mode_info(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
 	struct mode_info *info;
@@ -84,11 +84,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 
 	list_for_each_entry(info, &reboot->head, list)
 		if (!strcmp(info->mode, cmd))
-			return info->magic;
+			return info;
 
 	/* try to match again, replacing characters impossible in DT */
 	if (strscpy(cmd_, cmd, sizeof(cmd_)) == -E2BIG)
-		return 0;
+		return NULL;
 
 	strreplace(cmd_, ' ', '-');
 	strreplace(cmd_, ',', '-');
@@ -96,21 +96,25 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 
 	list_for_each_entry(info, &reboot->head, list)
 		if (!strcmp(info->mode, cmd_))
-			return info->magic;
+			return info;
 
-	return 0;
+	return NULL;
 }
 
 static int reboot_mode_notify(struct notifier_block *this,
 			      unsigned long mode, void *cmd)
 {
 	struct reboot_mode_driver *reboot;
-	unsigned int magic;
+	struct mode_info *info;
 
 	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
-	magic = get_reboot_mode_magic(reboot, cmd);
-	if (magic)
-		reboot->write(reboot, magic);
+	info = get_reboot_mode_info(reboot, cmd);
+	if (info && info->count) {
+		if (reboot->write_array)
+			reboot->write_array(reboot, info->magic, info->count);
+		else if (reboot->write && info->magic[0])
+			reboot->write(reboot, info->magic[0]);
+	}
 
 	return NOTIFY_DONE;
 }
@@ -173,16 +177,22 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
-	u32 magic;
+	u32 magic[3];
+	int count;
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
 
 	for_each_property_of_node(np, prop) {
+		memset(magic, 0, sizeof(magic));
+
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
+		count = device_property_count_u32(reboot->dev, prop->name);
+
+		if (count <= 0 || count > ARRAY_SIZE(magic) ||
+		    device_property_read_u32_array(reboot->dev, prop->name, magic, count)) {
 			dev_dbg(reboot->dev, "reboot mode %s without magic number\n",
 				prop->name);
 			continue;
@@ -194,7 +204,15 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 			goto error;
 		}
 
-		info->magic = magic;
+		if (!memchr_inv(magic, 0, count * sizeof(u32))) {
+			dev_dbg(reboot->dev, "reboot mode %s with zero magic values\n",
+				prop->name);
+			info->count = 0;
+		} else {
+			memcpy(info->magic, magic, count * sizeof(u32));
+			info->count = count;
+		}
+
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret = -ENOMEM;
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d61..29ae39935d690 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -2,10 +2,13 @@
 #ifndef __REBOOT_MODE_H__
 #define __REBOOT_MODE_H__
 
+#include <linux/types.h>
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
 	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
+	int (*write_array)(struct reboot_mode_driver *reboot, const u32 *magic, int count);
 	struct notifier_block reboot_notifier;
 };
 

-- 
2.34.1


