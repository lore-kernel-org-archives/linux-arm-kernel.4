Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF0A606A6A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=31VQRapg;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ENXDvpX/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QMRjH1CS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uEMw2lhJoodtkrvH+DpCLwm1Juvj6SN0Fvh2M0KWgiM=; b=31VQRapgY0HQVt
	7QrTiSv2ajexZjg64wY22D/4s+JFPgi/rgtakDJKQCDZdn2XCcC9gtfEzP/gwXCrqIBIeExG/gZKE
	X+SlW7ivyZyjluPrYxudL0VUSw0QYA0SkmrDHibOQTIa7VAFySPDJD2I5gbV0s7jTrW3JZ+RTyrTh
	NETWqgqiMUCiBWQTQoIEFrY6Mo/fqYj134lWR56jUgBzG3icaDHPtuGZjbv8uNtoWXVmyPittKE+n
	/DlW1gVofz9l0ozW5zi7z8tVvQaB5oXJGLJnQArtKdKh5VBR/yGhdMN8DCHIDi0hOyGPO8/ROqo08
	BvIyRrWX9tselwTX5+ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxcD-0000000Gi7Z-20lI;
	Fri, 27 Nov 2026 15:11:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxc9-0000000Gi6b-3ZDM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:11:55 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1J262376286
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uEMw2lhJoodtkrvH+DpCLwm1Juvj6SN0Fvh2M0KWgiM=; b=ENXDvpX/Uc/bNtqe
	pcF4/Zxmz8OgmagkMXxBJsfDARQgpgXFnNyfIRQcKrJogS9UzgiqWyfdIlQZ77ZV
	NZs7M3bUnpNnXIe2UMYN+9pC1itEvKM0Kn1EnPrLtGpbK+5DN1Esne7euDa9uedj
	57oDXiCBtcy4UjUP4hem6XHHAh+i15whdQND0Ri/naQQpR5EfuH4MJpDh/PZTdVS
	omcVLiPscNIc8U9bO1K96TNHhsBqxg3X8TfNfLaA+RBL9o6FQJEvZH0BDnNcN2qm
	WZDS9A1r9ijQTzIggfdppDblXwk9B0E/F/5zZN4j3dyR+LzXqov1MYK8xHfnktvp
	WtNi7Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hueh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:27:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f0467a525eso61251685ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 06:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789662; x=1796394462; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEMw2lhJoodtkrvH+DpCLwm1Juvj6SN0Fvh2M0KWgiM=;
        b=QMRjH1CSKvekIjFLycibxqNPluWAHEbnkkWP5qe24Hc6WVcFqaqHX8MLM3NXL03bz0
         n5ssy/ok88Az6LioajmL/19vyaqU8nuOeMGCGo1TzB9F77eul0jznbHJ6Vs+16lzql1x
         ssi5y3t4Uy3ikRsb18mPXt3nYQolpYU7rLrB9RsZozYmw+xOLGj3kDyvfTb44S/x4O6e
         AGCwiaJBy/SgXoylL7e5ZklQUfmKivW9towWmpLq1ry6H4E+gxa6NYYsex4b5fYbEsYc
         ulXI2drqPkW9ysJfz4JYEvfAwpVLDy0uQlXeovtMEPLG514dNjMOTpgAgktRgUPhNe++
         m1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789662; x=1796394462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uEMw2lhJoodtkrvH+DpCLwm1Juvj6SN0Fvh2M0KWgiM=;
        b=FnQ0hy6347awTfFo6y3cxqX0S++Tf9iDj0rvl3tpL9omVWod4igE1Caz4UjDMWmrAW
         Lkt3mEmlILv+kxoi4kfxMCZtGre6TKS2AmCD9BJonektr/So0z+csOGozkzkiXoIuUW3
         9dGFnu5a3TpfYQYyDPgHNb4nprB70mrSI12l4Hkw7OMI+fUPiOku1sRep+7rJaiL2nkR
         ykYGpEEuALyxryR8HqSy1DxMpXkGJPeWn/J1JIwZ8aEglrMyT8zd7UQ+ub1LVKaDmRjV
         6n6fEmHtfK3aRPOo4ZQbjlmUupZzQ9mERLie4Cg6OKksIv+hfJ/bkT1u+ITYq0V3zjre
         Dciw==
X-Forwarded-Encrypted: i=1; AL+hErHzKtKeqtes/XIuyHQzoBNV9a1RXrCjy0rP+ITYkglo8YO1e6OOgjyxOSeJzj6XxYWlKbZbLtMBU/hzTygBlFkL@lists.infradead.org
X-Gm-Message-State: APuU4Z9QzzQEL0YfhFv9WIfNJFZSdacsQns7Kfo4tU5F6agh3LqsPo8y
	N1fiQCKJn1z9fYT+rsHY5ItOEGt05oWTDrBltcb2VDRaZF4BadQ0dARxIQHZ7qHAH13/lCm3bnq
	/Yf2gAlkHIWqcrQQxcj1Sj1Kk2U8BO6Ihvp7qsPbnA9r0sCCa6BeXaX9Xe9WJL3xtwGUZMlEx0p
	6o4Q==
X-Gm-Gg: AZFdTZf+XnEJFlnkT1urLWKjOLHzu6+H6lXycZWPYmxhwaYM81+dc/pRc9B83HYUhyS
	lnyIOyByCKGbCLhvkxu3B+JHWm0kR5HXlO7Wxi+MvLoifmLa+KjTpoeLTlwzI8auffRBIrwVd2b
	RlH5wXYsPMsRPf2Rrp44BLV+3y1W3RNUcBb+kUGOnWl3s93DrNgJgCdlsX6SihWyAHBazNxIpy2
	jMXBwbYA6oA/hg1t3GZmle8aslOkH/xJGEV2sI7psdivqYjH7VhAIV+LDaaetiveZbYkaCCYc8g
	ksWr3V+v6IEy0bmjB/B2ZJhwY3qmZo7tzqyCncgC/YOwWH3wQ5uYlSiyUjl7JATNEQ8TWHQ9EBT
	H4AzKCSG5Y3tAnzFxkASA4Kw0oMnMsX6NUAy1Yw/gXKAABqn/w7Rf7mZVNQs6U+/58wYe40cE6j
	S2UYAwzNzfJA==
X-Received: by 2002:a17:903:2984:b0:2ef:f656:2db8 with SMTP id d9443c01a7336-2f03f1a49ccmr254184675ad.30.1795789662004;
        Fri, 27 Nov 2026 06:27:42 -0800 (PST)
X-Received: by 2002:a17:903:2984:b0:2ef:f656:2db8 with SMTP id d9443c01a7336-2f03f1a49ccmr254184385ad.30.1795789661500;
        Fri, 27 Nov 2026 06:27:41 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:27:41 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:56:56 +0530
Subject: [PATCH v28 03/10] firmware: psci: Introduce command-based resets
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-3-da05a33b08d8@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=8137;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=yfPrLsKko5Gv66TXus9j/mTCGhTszpPbkRWeO3+zgec=;
 b=7HYOK+PPPPXBwd4SUWKSfEGXzBTJKTJ2b4gfvPygJje8l2n2eJnuLu0kf5Y1hZyVYrhBnYjpX
 fYNaFs8568kDs7TN5J3NJh1EY/gurtcePAzCcidLObeMvlQTgo/lA8p
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX4ybikXmp+m/z
 BgkrkQFfdOE1FPsb51PZkOAMebvgVeLD0WvekAb0PADNrxmftjTqYMgCwJOOKePKnSAKbmI6YiU
 oqZNvNan6k72GtGpPHoN8TUaPi4y/Ug=
X-Proofpoint-GUID: V0AQ6GrPshYkBePBNQED31-Nyznwgqox
X-Proofpoint-ORIG-GUID: V0AQ6GrPshYkBePBNQED31-Nyznwgqox
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b09935f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=njxsUegImOJjkw56WvUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX5dE2lKn/+a3I
 79wZYK/qtfNAhWsKQXkE6mKuJY7nPLQmUQVga5/hHyrzUMR3EeoshzHUwXB9xVWSOIhZfD1iguI
 bON+oWH9RK1OV61VAc8yBz+HbshA9RIVay/q7wTCH17KN1MLKedZl4PyPyzLmvO/yhriB5vzMX+
 28/ABvLSxeOpdbTB0PkTiY6POHux5EQoYO/reqBxCwpE5gmdFo1VmEZhWVzIy5wt2sV4jPeilVt
 up5ubRjlayP5aF076EMqUqxi2G0ur+bAPfi2q8HN1xQb6+ZjDWEqFEYKfgMSKAlTHTFPHLYv9Sb
 oRGNIhEAyVaP5d13++RZ1KjRSgSKJa6BhvFnu+Upavwltfb7StfFzEZM7uFm4leFZsoPh2C0i6u
 TwKJaYKn7Lf9HB3m4d0cU3qdc2Y7LaZaZRu3cZPncVdBbwGyMxb4YRaE8j3lTYSyrPljzlGJ2XT
 QC5j7uQX2GrYisTM1aA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_071153_908075_0D7547CD 
X-CRM114-Status: GOOD (  29.25  )
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

PSCI currently supports only two resets - SYSTEM_RESET and SYSTEM_RESET2
ARCH WARM reset. The reset patch is selected based on the Linux
reboot_mode variable. The PSCI specification now includes SYSTEM_RESET2
for vendor-specific resets but there's no mechanism to issue these
through psci_sys_reset().

Add a command-based reset mechanism that allows reboot-mode drivers to set
the PSCI reset command by passing a reset_type and a cookie.

Add support for the following reset commands:
  - SYSTEM_RESET2 vendor-specific resets.
  - SYSTEM_RESET2 ARCH WARM reset and SYSTEM_RESET (reset_type = 0 and
    cookie one of psci_standard_resets).
Unsupported commands fall back to the regular PSCI reset path.

Default to the existing reboot_mode-based reset flow unless a reset
command is configured. If a kernel panic() or a emergency_restart()
occurs after a reset command is set but before the final PSCI reset is
issued, ignore the reset command and follow the normal reboot_mode-based
reset path.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/arm/psci/psci.c | 117 ++++++++++++++++++++++++++++++++++++++-
 include/linux/psci.h             |  15 +++++
 2 files changed, 130 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm/psci/psci.c b/drivers/firmware/arm/psci/psci.c
index 01b1ea6a1c655..2ee3b01011a46 100644
--- a/drivers/firmware/arm/psci/psci.c
+++ b/drivers/firmware/arm/psci/psci.c
@@ -11,17 +11,22 @@
 #include <linux/cpuidle.h>
 #include <linux/debugfs.h>
 #include <linux/errno.h>
+#include <linux/kconfig.h>
 #include <linux/linkage.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/panic.h>
 #include <linux/pm.h>
 #include <linux/printk.h>
 #include <linux/psci.h>
 #include <linux/reboot.h>
 #include <linux/slab.h>
 #include <linux/suspend.h>
+#include <linux/wordpart.h>
 
 #include <uapi/linux/psci.h>
 
+#include <asm/barrier.h>
 #include <asm/cpuidle.h>
 #include <asm/cputype.h>
 #include <asm/hypervisor.h>
@@ -51,6 +56,15 @@ static int resident_cpu = -1;
 struct psci_operations psci_ops;
 static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
 
+struct psci_system_reset_cmd {
+	u32 reset_type;
+	u64 cookie;
+};
+
+static struct psci_system_reset_cmd reset_cmd_data;
+static struct psci_system_reset_cmd *reset_cmd;
+static DEFINE_MUTEX(reset_cmd_mutex);
+
 bool psci_tos_resident_on(int cpu)
 {
 	return cpu == resident_cpu;
@@ -80,6 +94,64 @@ static u32 psci_cpu_suspend_feature;
 static bool psci_system_reset2_supported;
 static bool __maybe_unused psci_system_off2_hibernate_supported;
 
+static u32 psci_get_sys_reset_fn(const struct psci_system_reset_cmd *cmd)
+{
+	switch (cmd->cookie) {
+	case PSCI_SYSTEM_RESET2_ARCH_WARM_RESET:
+		if (psci_system_reset2_supported)
+			return PSCI_FN_NATIVE(1_1, SYSTEM_RESET2);
+		return 0;
+	case PSCI_SYSTEM_RESET_COLD_RESET:
+		return PSCI_0_2_FN_SYSTEM_RESET;
+	default:
+		return 0;
+	}
+}
+
+/**
+ * psci_set_reset_cmd() - Configure the PSCI reset command
+ * @reset_type: PSCI SYSTEM_RESET2 reset_type, or 0 for a standard reset selector
+ * @cookie: Vendor-defined SYSTEM_RESET2 cookie, or a value from
+ *	    enum psci_standard_resets when @reset_type is 0
+ *
+ * For vendor-specific SYSTEM_RESET2 resets, @reset_type and @cookie
+ * must contain platform-defined values.
+ *
+ * For standard resets, @reset_type must be 0 and @cookie must be a
+ * value from enum psci_standard_resets.
+ *
+ * The reset command may be configured only once per boot cycle.
+ */
+int psci_set_reset_cmd(u32 reset_type, u64 cookie)
+{
+	if (!reset_type && !cookie)
+		return -EINVAL;
+
+	if (!IS_ENABLED(CONFIG_64BIT) && upper_32_bits(cookie))
+		return -EINVAL;
+
+	scoped_guard(mutex, &reset_cmd_mutex) {
+		if (reset_cmd)
+			return -EBUSY;
+
+		reset_cmd_data.reset_type = reset_type;
+		reset_cmd_data.cookie = cookie;
+		/*
+		 * Publish the command only after both fields are fully initialized.
+		 * Readers run from the atomic restart notifier path and must not block.
+		 */
+		smp_store_release(&reset_cmd, &reset_cmd_data);
+	}
+
+	return 0;
+}
+
+bool psci_has_system_reset2_support(void)
+{
+	return psci_system_reset2_supported;
+}
+EXPORT_SYMBOL_NS_GPL(psci_has_system_reset2_support, "PSCI");
+
 static inline bool psci_has_ext_power_state(void)
 {
 	return psci_cpu_suspend_feature &
@@ -306,8 +378,25 @@ static int get_set_conduit_method(const struct device_node *np)
 	return 0;
 }
 
-static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
-			  void *data)
+static void psci_handle_reset_cmd(const struct psci_system_reset_cmd *cmd)
+{
+	u32 psci_sys_reset_fn;
+
+	/* PSCI_1_1_RESET_TYPE_VENDOR_START identifies vendor reset types. */
+	if ((cmd->reset_type & PSCI_1_1_RESET_TYPE_VENDOR_START) &&
+	    psci_system_reset2_supported) {
+		/* PSCI SYSTEM_RESET2 Vendor-specific reset */
+		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
+			       cmd->reset_type, cmd->cookie, 0);
+	} else {
+		/* Retrieve the psci reset function from reset_cmd */
+		psci_sys_reset_fn = psci_get_sys_reset_fn(cmd);
+		if (!cmd->reset_type && psci_sys_reset_fn)
+			invoke_psci_fn(psci_sys_reset_fn, 0, 0, 0);
+	}
+}
+
+static void psci_handle_reboot_mode(void)
 {
 	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
 	    psci_system_reset2_supported) {
@@ -320,6 +409,30 @@ static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
 	} else {
 		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
 	}
+}
+
+static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
+			  void *data)
+{
+	const struct psci_system_reset_cmd *cmd;
+
+	/* The function psci_handle_reboot_mode follows reboot_mode based
+	 * reset flow and psci_handle_reset_cmd uses reset_cmd based reset flow.
+	 *
+	 * The reset_cmd is configured at the reboot_notifier phase.
+	 * If panic() or emergency_restart() occurs between the reboot_notifier
+	 * and this final reset, skip command-based reset and let reboot_mode drive
+	 * the reset flow.
+	 *
+	 * The function psci_handle_reset_cmd invokes non-returning PSCI SYSTEM_RESET
+	 * calls to reset the device. If it returns, either the reset failed, or the
+	 * command was unsupported. Fallback to reboot_mode based reset flow.
+	 */
+	cmd = smp_load_acquire(&reset_cmd);
+	if (data && cmd && !panic_in_progress())
+		psci_handle_reset_cmd(cmd);
+
+	psci_handle_reboot_mode();
 
 	return NOTIFY_DONE;
 }
diff --git a/include/linux/psci.h b/include/linux/psci.h
index 4ca0060a3fc42..e81b1cdeca519 100644
--- a/include/linux/psci.h
+++ b/include/linux/psci.h
@@ -8,6 +8,7 @@
 #define __LINUX_PSCI_H
 
 #include <linux/arm-smccc.h>
+#include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/types.h>
 
@@ -21,6 +22,16 @@ bool psci_power_state_is_valid(u32 state);
 int psci_set_osi_mode(bool enable);
 bool psci_has_osi_support(void);
 
+/**
+ * enum psci_standard_resets - Standard reset selectors for PSCI reset
+ * @PSCI_SYSTEM_RESET_COLD_RESET: Standard SYSTEM_RESET command.
+ * @PSCI_SYSTEM_RESET2_ARCH_WARM_RESET: SYSTEM_RESET2 architectural warm reset.
+ */
+enum psci_standard_resets {
+	PSCI_SYSTEM_RESET_COLD_RESET = 1,
+	PSCI_SYSTEM_RESET2_ARCH_WARM_RESET,
+};
+
 struct psci_operations {
 	u32 (*get_version)(void);
 	int (*cpu_suspend)(u32 state, unsigned long entry_point);
@@ -45,8 +56,12 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void);
 
 #if defined(CONFIG_ARM_PSCI_FW)
 int __init psci_dt_init(void);
+int psci_set_reset_cmd(u32 reset_type, u64 cookie);
+bool psci_has_system_reset2_support(void);
 #else
 static inline int psci_dt_init(void) { return 0; }
+static inline int psci_set_reset_cmd(u32 reset_type, u64 cookie) { return -EOPNOTSUPP; }
+static inline bool psci_has_system_reset2_support(void) { return false; }
 #endif
 
 #if defined(CONFIG_ARM_PSCI_FW) && defined(CONFIG_ACPI)

-- 
2.34.1


