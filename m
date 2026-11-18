Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08708606A338
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 06:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nLgjdCQj;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocFocBd1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iXt7kOav
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yOCQbA2wY5BnvDNCmEwPpHQ2C1R6OpFI9nR4EwL4mVc=; b=nLgjdCQjEdufdSGXkAjSb/g6Cc
	NstyvqyLpz3W4HJU5GQFUZyt1dCuHquuf58ACSn9Y2AbVUz4agYknwxvEXgAWqmLRYCvC2eTkNQ+x
	ED/vHLn4IQoUV3Qa3OSpUYsp2qR4ZsuDSYsSvo/Jgdf2BGbmtruOEoOOVDxWlS8Ro56Cb6Ypy5Mhd
	FJmlegxxQHEgaqTY42eR2MMafOgIyXwo5J5liC3MzWCjCIl5j1RCckU/Rp/Yj4EAw5IEX7phX4GXf
	KuAGVLlj5fKbwFJidV47wdRCJ3cwG5P3clu51Xhk0TiBko8jqa/OilxvSX8DckjAgyJLKlCkS1C3f
	LVkhgtQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYp3-00000007pfr-0z1O;
	Wed, 18 Nov 2026 06:07:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYp0-00000007pfO-1o27
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 06:07:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V5eC764264
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 06:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yOCQbA2wY5BnvDNCmEwPpH
	Q2C1R6OpFI9nR4EwL4mVc=; b=ocFocBd1+X/sFdLPGnl5ewkR9MWzKhmO8zM35z
	Z6A7DBz6+yIvrTICliYcvxBWbMdLulaXxP8wuOHig/o3aUvET/YjG7pHn+aqHPDj
	Le3hkvPqg2acr5gM3e0czCHTsAYnYcqtShHsQzusIysyYcYMDambB1POfCIyvVSQ
	UZ4v4g0oJyhoClg7KCmeeegBvkryzmBHtoqhRY90cGaaSQi5H6eQH+o8A0CEmPe3
	DG77vGcFwHJFsuxjl5MRCpt3r/AwAr1/5ODFQbZI3ot3x2bTS6E4Vvyb0DLBJNbC
	62sOIWTRa/ofEleMpx0trbiQi90O/pkOe6UhoLR+79KeUmEw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb9fcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 06:07:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so797509a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 22:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982024; x=1795586824; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yOCQbA2wY5BnvDNCmEwPpHQ2C1R6OpFI9nR4EwL4mVc=;
        b=iXt7kOav5U6Eoi85lSnRdMnjC3GQoEXTh7v+9wV7nad4szTjVoS/2wyH9+Z2DDHJSX
         f5qqU0UnWNSGLLhImAJlaYFAg6k/1D+PlPo1BPznDtMThX+LPeiDjH0nxXlJ4TERkh/H
         nvFTcV8/m28V3PZ3TWwLjuGfDw0N3M5xR9w8KMOnAy7BX1JjUbIb0dMB9eDXkRQDeAUV
         dpNcRVq5TQqFism9WFvWizkk4YMxyuhfPi57Yt5LfjG+QnioLS/5stSp6FFzmhriWl5N
         qt5eDTm6LSsI40dJNoY1kpVl4vLzp24ypNCI4UUzpBJzZTtW5HVeiRFlqbwZ3JF4uOC9
         VW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982024; x=1795586824;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yOCQbA2wY5BnvDNCmEwPpHQ2C1R6OpFI9nR4EwL4mVc=;
        b=oG/5uWP3ip9PMeCUkJ23+HoX2uHZc0+PGgCh3+b+vGQNuf8p9Aw3miC1RfJWGN3bRF
         hvHEGyVfi1ar2gMGG5NA3VWwkX8z0wB1/gi8VqLECvsm99fpmzGK1yVoESbZVoQPAQaR
         f7BnYONtPJV+2JXRRLiHxpfMHTdxfmve28LriF/MySXlMlquyBFtHVLIspsde2t3UXPk
         PlhpsTSqN2iE9SCHll+30ZR48l7MiZeY/aHqaj8KbSgmcbXd9hqf7aaaSZpoHV6aItsY
         fmqby3TgW7XdSIsdpF7NE3GxDyhAwqc+iwQop+7+SvPYa/kgAhfVcY0DIgpMPDwe2meV
         qhyA==
X-Forwarded-Encrypted: i=1; AL+hErHbWx5SQEVKn8E3m/vMiA5TZgfuNTTu9CurO+gm72jOOOUkmojz3bok3bLXUB0wufoyd8EfJkdJCaBmot1UEgTZ@lists.infradead.org
X-Gm-Message-State: APuU4Z8CLjs9lYHYJ/8vS7OsmaS66ou0TPRmOHX6pIWGoCtJ8v8ult6V
	nDu18HEvLHWEw5GBzgsuTCS1gpcBd8MvoUhAbiIS/LrU2FRKilf8vdZCViVKkvq4BTkA3QBglP7
	3fZMbKZB1mdUOSW9HJOE7DBsmyeTh9b6lhA00fXm5fkIZs1CXyVqoGA2AfFNSAMlQeACyMcu9E7
	FGjlOklc+5KA==
X-Gm-Gg: AZFdTZdXzgWHtthDXdCjuAgXphN58gqaaAdUwlL4yO+nG0qDEg7+Bugf9Qldz5qEBkV
	kF7qKg8XMaChg+4B2vosubdxZkXuMGUM0vGozCimmddlY/Jp0aYAshudtXIZdHUJozASnHcAEwN
	3i3fDXsqHzbj2R5PU5IY8qIlGeUbbl1AYLJZ5b65m+/a1t/1mhSGfr5mJbOBDY570rS+9htnRIE
	465aBN1TlI+xu89qISTGAPfa8SHIlv1faASknVmalkXG5Z9EatsdPn5NYFT55ToyhIWsvRJa44i
	Vs3A10RwY8T/o9l0DanaZYfiUxO4AgJ5hJiYnfobWT9H7ltH1yUMKzFW0eMKi+sbxaeolOC3DiQ
	nDIpXJ7EcFeohIOTDyE/BGBbQ5LzVe7PJsWbgfAonvReoCTNrA7+p65R8Uu44dzUWjunqGYSRSv
	GBun8=
X-Received: by 2002:a17:90b:3890:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3b3d07d52bemr1757203a91.67.1794982023874;
        Tue, 17 Nov 2026 22:07:03 -0800 (PST)
X-Received: by 2002:a17:90b:3890:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3b3d07d52bemr1757168a91.67.1794982023252;
        Tue, 17 Nov 2026 22:07:03 -0800 (PST)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abb786ecsm7476382a91.2.2026.11.17.22.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:07:02 -0800 (PST)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Add fallback method to handle RPM notification in
 MPM driver
Date: Wed, 18 Nov 2026 11:36:17 +0530
Message-Id: <20261118-b4-shikra_lpm_addition-v4-0-46ee87e22576@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFlA/WoC/3XPTQrCMBAF4KtI1kaSSdpGV95DRCZ/NmhbTTQo0
 rsbFcSF3Qy8gfcN8yDJxeASWc0eJLocUhj6EuR8RkyL/d7RYEsmwKBmNW+oljS14RBxdzx1O7Q
 2XEqFSlxqo0Cjd46U8ik6H25veLMtuQ3pMsT7+07mr+2HbLiYIjOnjAqrKmU9GK39ekhpcb7i0
 QxdtyiDvOQMX40zXk1qUDQ0jefIbFULNaGJHw0m382iaBIkamONVyD/aOM4PgFl3JlUXwEAAA=
 =
X-Change-ID: 20260617-b4-shikra_lpm_addition-4a9bc82bafee
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794982017; l=3315;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=PRPGaYLGmhNCUHjIssf8urCHwf49nXM/4eEJNt3ORxA=;
 b=EOohxv1ZnOJUxvyvaTp6btqK3MNGqfePG9Pi7+5ki2K19SbkUJM2hFpxvgve1ZKveGwU5OPA9
 OJmGKGltEwnAtzn5OiFdoRv3G0qvfPM5LipyJ8DKCk6/jhtN2mvU6WM
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: GOVs4xpgi4IIEHzDdDcvZJDDbbt7qMqz
X-Proofpoint-ORIG-GUID: GOVs4xpgi4IIEHzDdDcvZJDDbbt7qMqz
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd4088 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=-g7Su3eQ9jgtFDl0TfQA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX1vlZGkMT5I3L
 hdfhN0hcCDT+GiClpgue5+EQ/ggqA/Zu1HT8hS5HJ4NYgSwHM/Llw/jtxeStbSOMSlOTR0qu+9L
 QNGg3eASbdKeJecsURf4zVkqa8Tph9o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXzAsiVKlV7izD
 dvVETVNM+T+evvV1ZiAeszT1D6lt8NHMo5Ffux2TWQYVQ4L2/g0CQ+0KmmxnKNeiVeAqZXpvhnu
 e2sGBdssaUMZKBi2nRehjTBty3b7GlQTBg5JxDa3vJuGzotqnnwW2knAFYx0qZkSwOrcm+mf/Nj
 cuiAWAmZLfLb3TTIBO3Y5rQIvmeEeOrokVpDaim08xoHVZEEbyKP/9/hBQJkwCcZ7S1k3asrRP1
 1JbCupIQx0RS+DZGQa7nYOlMcV4iziRgCyVXOrEtSkas06cDlLxFeC4pRh8uOD+FvL2Kn/Gh2UP
 MZyGHPZfKvGlqPPIUBZJDwb+AWMRLp0eJO7gjWt6+2co3j5xNCxSNvPAJd1raDM/N7Jz4HVK1I6
 8qc/3ZeAaxiTbb+2m8H7HdfUcnncFt8F0do4/9uYMcMjshPxjgOWBMBDyLdmejjVU6b8C6GOyHL
 vj8b6sDUCJIhNfpSmog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_220706_531300_2484EB8F 
X-CRM114-Status: GOOD (  17.60  )
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

MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
the latest wake up capable interrupts when the CPU cluster is entering the
deepest idle state. This is done by sending IPC interrupt to RPM and is
implemented as .power_off() callback by registering MPM as parent power
domain to CPU cluster.

Such implementation earlier introduced a hard probe dependency between MPM
irqchip and CPU cluster power domains. That is MPM irqchip needs to finish
probe before PSCI power domains are probed.

The above problem has since been resolved after bd7f488a8e5d ("cpuidle:
psci: Fix support for probe deferral by dropping the faux device") / [1].
However, it makes sense to remodel the RPM notification in MPM irqchip due
to general consistency.

MPM is not really a power domain provider, all it needs is a notification
when CPU cluster is going to power collapse to carry out the RPM
notification. We can register for CPU_PM notifications for that purpose.
This way we can avoid such unrelated dependencies.

We cannot register MPM under CPU cluster power domain and rely on
GENPD notifications here, since that way cluster low power modes will be
blocked whenever some consumer of MPM, and in turn MPM itself, are
runtime active. This will add another unnecessary dependency for CPU
cluster low power modes.

For now as first step, register with cpu_pm as a fallback to manage RPM
notification. Trigger the RPM notification when the last CPU in CPU cluster
goes to power collapse.

Add idle states for CPUs and CPU cluster for Shikra.

[1] https://lore.kernel.org/all/20260909134240.685115374@linuxfoundation.org

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v4:
- Some code correctness in the driver changes introduced.
- Link to v3: https://lore.kernel.org/r/20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com

Changes in v3:
- Skip timer programming for now till we add support to register MPM
  under CPU cluster power domain without blocking its idle states.
- Skip modifying DTs other than Shikra to prioritize Shikra LPM
  enablement.
- Move genPD/cpu_pm registration after mbox_request_channel().
- Link to v2: https://lore.kernel.org/r/20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com

Changes in v2:
- Enable Shikra LPMs in the first patch, following patches concern
  MPM driver.
- Register with cpu_pm as a fallback to manage RPM notification.
- Move USECS_TO_CYCLES and xloops_to_cycles to common header delay.h.
- Reformat qcom_mpm_offset() as per feedback.
- Avoid deleting cluster_pd node in qrb2210-rb1.dts.
- Link to v1: https://lore.kernel.org/r/20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com

---
Sneh Mankad (2):
      irqchip: irq-qcom-mpm: Register MPM with cpu_pm for RPM notification
      arm64: dts: qcom: shikra: Add CPU idle states

 arch/arm64/boot/dts/qcom/shikra.dtsi |  93 +++++++++++++++++++++++++++++-
 drivers/irqchip/irq-qcom-mpm.c       | 106 ++++++++++++++++++++++++++---------
 2 files changed, 173 insertions(+), 26 deletions(-)
---
base-commit: 7777cc195ca1301a28008ca5cdb98bdb2a9d0def
change-id: 20260617-b4-shikra_lpm_addition-4a9bc82bafee

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


