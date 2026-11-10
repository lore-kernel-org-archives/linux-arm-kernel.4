Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0E1606A7EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gHa5Kah5;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XYkrWJgp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PWsFJgyz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wedbrXh177mbzmYM+3txzr4ofpzd2UDd+z7ICvagmsM=; b=gHa5Kah5ypQut6MvpkXcW41dAF
	jx6IlClAeDAa3XSLNJWaQQFNyM+m9YlRLuZY03YQBAp9H+9gMhrBi55eMc9iT/zPh3WD3sP79Tq/X
	oPeooTJ5U8f+YdmZGp5/k3j+uIe0+NLJ0ZKjEc7w2i0jeA3GE6Ev3mkn2Z7xG20OVbJ11c3Yx+BLD
	VieFdcyIVcGRNbGNSoyn2nTQBTZt3CZjPIfRu/K8GolkN+UZbRXv/Z3kDobcUz+WaQ+mkq1lxZF1N
	ks9pxDriM93+wJOfBNO5HVObGJYS7diWuz/yi1L9p7CKzE5XwjImdbIcI14Ntpy94aR2L/EcLeIrG
	EF8ZAeHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlmt-000000041jg-3EfG;
	Tue, 10 Nov 2026 13:21:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlmq-000000041io-2v1j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:21:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAOBU1599664
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 13:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wedbrXh177mbzmYM+3txzr
	4ofpzd2UDd+z7ICvagmsM=; b=XYkrWJgpRa06p1t340wdOzXmWXTRgyqCfNJFBl
	eWdpDzKL/23EU2D72H96WXxiMPbR2PHzscSUYks5STxiYudNtOMp1evTvt1/N2Sc
	QfCHV6+CbxCVV8/6JzHiHm95OHA/Yx5tUFNwxjTdJErtrLMqICsUPXQXonzPh8X2
	LaJPqNoT7kYM6eRXzREoL1nTa2At/FW6ar5UrUMvHa+q6lXJNr42URX47wMMUhUR
	qs4n04Vrw5VKURJIQCUqjokEjpjdcTE+MZfBvLpLXBbiPl1er6z/ixbREzrYi3m0
	Q1tuCmFQX7rZRfi9YXD/EoknlrYXpAXsK5jyaReIy/v3DJiQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv4a7ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 13:21:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2373e9b4so235331185a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 05:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794316879; x=1794921679; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wedbrXh177mbzmYM+3txzr4ofpzd2UDd+z7ICvagmsM=;
        b=PWsFJgyzz+q3yOSuA5V1g/PdK0xOEmEEAWeHcLchqlNZ3kFFpCFtbCzBn2isJDuMo8
         g3hJ/E2arQkEFjsGghVSaC0s+utGQewkt04cNa2C/FVSrYqxF5el6mBGC58wdHGKBDTk
         bM4iLNPDNnPKCSfjG7FxTFOzvIhQUVQm5cUnFPOxReIn6EedYiDKiLSE83QmEsdc2w3w
         tUQ5nGQXcm8VmVjqgz6V7LcTaADzIhZC9E/mq6MBExjbRlRXca8Da2ZdM759xRt4zK/g
         BCJLU0Dm+9XTAtAwlnAgTZwLhFkdLhOk23BsIFONgsbjWiTjOTX45m8tPEfICVsJ5/0T
         71CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316879; x=1794921679;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wedbrXh177mbzmYM+3txzr4ofpzd2UDd+z7ICvagmsM=;
        b=h/2uqAVlWcuttxvCaVurhvitJQc/pl6s2xBzcCqjm/ej7H83qcXbpaVyxfc8LlX7In
         NWnHaAec9RYd7/aSJg9O3AdYIk8cg45Ug0sgkJZaejyhxwaJjbNqvZ6fpp4RAJvcMDSP
         vL56i9MVFC4i9rzoBzU3r5WqBgvxkc4+ELBToKDQhDsnHVgA6Tz6N/VmJYA7EtqMlcOc
         MZaX84p3KIYSKtf1WnH3/0VMqWdTahPtntabtQ86tJjLO1h9vYorUNID7/5soehJcTej
         BjOOKfzeNYpDnIO+dkHZOm84sp3JBxislk+H7ZjPnUSSwXkGRG6fi5oF5AGcZ0PDR4CA
         iAfg==
X-Forwarded-Encrypted: i=1; AL+hErHvkUujYEo06lE1C4/fKgQ2rBlcgw/osjSXIoKcj4HaayG3jy4uaLYyf9kC+CxY60dJDcz5ZUvAPWP3YAt6jyG3@lists.infradead.org
X-Gm-Message-State: APuU4Z/RCW1x1T0ik4aMHpr4B39ZYuqSLOkCmvqNl93jm00Pg0/zl/2x
	RZNlkx8uVTZFUDKSarMnDXAAs3QQSYfwS3JClNApUjv1hX61171Bt47dmvNy/a4YhRpWlgh3MXF
	VTLX3NMRm3M4jNE7ynC8W10PjEifiQAq+FfZMLl1UTgMH9EEI8sbShPlrEnQfWdCLmfVCXtyP77
	WrgqUQ1VLIcw==
X-Gm-Gg: AYBFou2aIKleflNJiYAx3xmFvFIRCpRmfbfDO/FRq+hvK64uLC90cYCXCe/k5DnOISj
	1qxIuG8EzND/JtmcrY2YuYtfIlCRVGpfaG+AMc1ikwbKf/yI6BRHHRxFoZSgQA8E9pN3QCv11e/
	JZ1ufYJgj4tAZLxUHHPiZk5Hl9DoAWtsWGvN6C2uY58tKw3rlzYcrKvekfpxh3rTkc98C3/SCpx
	xjLIuIB2jpyQprbSJn+SB6mdf0b4/q3N6MRfnB56JkBGUjX2IJJedWPHUp448A+yIZHAcmHbhJK
	xKAROr5jr/MoZrmJiCSfLwhHG4g1XE2sE/3cz2gj6qLTNTCHaJMhttSCTiwYroc7jut8ZF0l0DB
	ZoYYDdezDc77bYn4FUGx48+b0bvo0aQE6E2ppR2x1IC/71N90rD/hqhqt3jTKfLLnpxhO2JpXWu
	9aDdHgrzrK0u9yXErlYYGF9ljmy4ZApDGeNJE=
X-Received: by 2002:a05:620a:4413:b0:93f:a63:15f8 with SMTP id af79cd13be357-9479f1d71c1mr399920285a.8.1794316878693;
        Tue, 10 Nov 2026 05:21:18 -0800 (PST)
X-Received: by 2002:a05:620a:4413:b0:93f:a63:15f8 with SMTP id af79cd13be357-9479f1d71c1mr399913585a.8.1794316878017;
        Tue, 10 Nov 2026 05:21:18 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:496c:dcb4:4deb:25e8? ([2a05:6e02:1041:c10:496c:dcb4:4deb:25e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm5047635f8f.10.2026.11.10.05.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:21:17 -0800 (PST)
Message-ID: <b9ff4d03-61f7-4e17-b048-3cecee70f3ca@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:21:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Heiko St??bner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Lukasz Luba <Lukasz.Luba@arm.com>,
        Linux PM mailing list <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kselftest@vger.kernel.org
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Subject: [GIT PULL] powercap: Add generic hierarchy support and convert DTPM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MyBTYWx0ZWRfX7JPIzRDWcCLX
 lCc8G0bIzGwoezB9GP5is4A9qFTaJGS9hNb2iYBQ+uI/Si9dTg6cM/YCei5krpmjgFmMpLyymFl
 BvhISxZ1wyrabZSnSA2lS8I6txNPbD0=
X-Proofpoint-ORIG-GUID: NaCxPHQJkJh46AeHliP4V2Obc1djQiYu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MyBTYWx0ZWRfX67Ylf9+Z5UBH
 55wBDLeR7sEWhZwWJoaAGr16M5eH8ChDbbh2bzu/P8dJSMZK7iPaU5gr6M7w/kzCYMTQwApaWUj
 1MYKZ+/lu//R5KVp2cRglSDDF7i4emwFV4LitXFUWVzxJ4hT4t+0Q1eTbj2TcBW69vaT7enTAbn
 g/6cUxaUq7k4PVV2TiwK54CECRtYalbHUZujw6NDs4hl0yGNHtrKNFUDKpd/Lujb9W8WS+U0n3v
 nLUeO0ZZ82bKBFuOmgfoR5YcagbQga5A4EsdweqLNrHTEsrDvlnq5ALeAze7MbpFiIiPPIQG6q2
 mqmc6J8mGA4A1AC3j/f7Lm5aK0vTMarm+tclRkOmEWXbo+++u+26+6Qk2M4BgXq652ihQlNz3yA
 gq3B9jweXAEmvoH064nYNLmY7d7D57wD0NmAykNvX+RXRF9BhlpL0WQ9GJIzxvBGcbnpDQPSnaz
 CEUZfh0g42Qw5gibEjQ==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af31a4f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GgbJc354ad6G5sA-JgAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: NaCxPHQJkJh46AeHliP4V2Obc1djQiYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_052120_757095_A1E09CAF 
X-CRM114-Status: GOOD (  17.95  )
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
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Hi Rafael,

as requested please consider the following changes since commit 
6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git 
tags/powercap-hierarchy

for you to fetch changes up to 6ba41a1519ff1f91f96d90a6bf4f70131a8f7c73:

   powercap: dtpm: Add RK3588 hierarchy (2026-11-09 17:33:40 +0100)

----------------------------------------------------------------
Powercap controllers may expose trees of power zones, such as packages,
clusters and CPUs. This series adds generic helpers to duplicate a static
hierarchy description, create its zones through backend callbacks, and
destroy them in reverse order. Parents must precede their children in the
node array; the helpers validate that ordering rather than sorting nodes.

Drivers supporting multiple platforms can place each platform's hierarchy
description and node array in initdata. powercap_hierarchy_dup() creates a
working copy of the selected hierarchy and rebases its parent pointers.
All original descriptions, including those for unused platforms, can then
be reclaimed automatically with init memory. Names and backend-private
data are not duplicated and must remain valid for the working hierarchy.

The controller supplies creation and destruction callbacks to connect the
generic hierarchy traversal to its backend. The creation callback receives
the control type, node name, private data and parent zone, registers the
zone with its operations and constraints, and returns it to the helper.
The destruction callback unregisters it during rollback or teardown.

The API supports both fatal creation errors, which roll back previously
created zones, and optional nodes: a NULL callback result skips a node and
its descendants while allowing independent branches to be created.

The helpers were motivated by the SPEL work and also let DTPM share the
same hierarchy infrastructure:
https://lore.kernel.org/lkml/20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com/

A kselftest exercises static and duplicated hierarchies, skipped branches,
reuse after partial destruction, and rejection of repeated creation. Its
userspace script checks the 16 exported zones and selected attribute
values, then removes the module with a sysfs attribute descriptor open.

DTPM is converted to the generic helpers while preserving best-effort
creation when individual backends are unavailable. The CPU backend finds
an online sibling when a hierarchy's representative CPU is offline.
Entirely offline policies remain unavailable during initialization.

The RK3399 description is reduced to one CPU entry per cpufreq policy.
The old backend already suppressed duplicate registration; the extra
entries were redundant descriptions, not additional registered zones.
Finally, a shared Rockchip virtual descriptor and an RK3588 CPU hierarchy
are added. RK3588's three frequency domains are represented by cpu@0,
cpu@400 and cpu@600 below a virtual package node; no GPU zone is added
for RK3588 in this series.

----------------------------------------------------------------
Daniel Lezcano (6):
       powercap: Add generic zone hierarchy creation helpers
       selftests/powercap: Add powercap hierarchy creation API tests
       powercap: dtpm: Remove duplicate RK3399 CPU hierarchy nodes
       powercap: dtpm: Use generic powercap hierarchy helpers
       powercap: dtpm: Rename Rockchip virtual node descriptor
       powercap: dtpm: Add RK3588 hierarchy

  drivers/powercap/dtpm.c                            | 180 ++++++------
  drivers/powercap/dtpm_cpu.c                        |  62 +++-
  drivers/powercap/dtpm_devfreq.c                    |  22 +-
  drivers/powercap/powercap_sys.c                    | 204 +++++++++++++
  drivers/soc/rockchip/dtpm.c                        | 129 +++++++--
  include/linux/dtpm.h                               |   6 +-
  include/linux/powercap.h                           | 205 ++++++++++++++
  tools/testing/selftests/Makefile                   |   1 +
  tools/testing/selftests/powercap/Kbuild            |   5 +
  tools/testing/selftests/powercap/Makefile          |  46 +++
  tools/testing/selftests/powercap/config            |   3 +
  .../selftests/powercap/powercap_hierarchy.c        | 314 
+++++++++++++++++++++
  .../selftests/powercap/powercap_hierarchy.sh       | 128 +++++++++
  13 files changed, 1153 insertions(+), 152 deletions(-)
  create mode 100644 tools/testing/selftests/powercap/Kbuild
  create mode 100644 tools/testing/selftests/powercap/Makefile
  create mode 100644 tools/testing/selftests/powercap/config
  create mode 100644 tools/testing/selftests/powercap/powercap_hierarchy.c
  create mode 100755 tools/testing/selftests/powercap/powercap_hierarchy.sh

