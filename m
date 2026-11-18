Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D752D606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kRF2AjL/;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TpSRxbv0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZDZWfroi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iTvIF9xRP0uN+SwNc6JxvB4VOROFp75+Uu1hHT20jpo=; b=kRF2AjL/SG6uyFubZzKdugWmUY
	YJxiJpC0SA+taXYpvU3wsovad7dxUEMdXV2s9aGk7ZTfxc8itFopi/FD3vrtN7tltRea+WgewVS2Y
	o6pxTeEBG3PUhv1y4ta2sIfsme1lFHApmpzX7egJqUTzh0GMOtmMPBZZ+pdXq9K06z42rg5/H0CKu
	ZJz+hHzedwra0AQrF3TgJZqHhtLFj7sX87ANn2vJq6z9Fa4qjEx3Dn0SmCmGTTDbRaVPrMTa8bMcc
	+MDVy9n/4F5Sl+I8fk5PrSbEqe6a67p61VfE1gvqZrtKmsPR34zP4VkGGPolp68rtWjH7s8WIl1r+
	CUuuScag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiLC-00000009Qln-1xQY;
	Wed, 18 Nov 2026 16:16:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiL9-00000009Qjt-2hcb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:16:57 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQMCu3912419
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 16:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iTvIF9xRP0uN+SwNc6JxvB4VOROFp75+Uu1
	hHT20jpo=; b=TpSRxbv09hrbhgSonNLCOwk+MS7oGBadtVKM++L5ec7fAptEewo
	FVMTMTrDhoTtW2NO/4/YK82Ee7wiUbgSNcNz18h0t6fSQNKunnJ4dIp7e4O2NYBY
	37CN4Ry7FGuR8yn8tNVfevW5+Rwng9zBK7p2u4aZZOz51PJZcPeETcbsCFas/pDl
	hw5KRSFr7naDwvmfU8M9AghqD2YREEwyNfoDBaEQGVwCOYC6MzKftNhbrbLd0hSJ
	gfrIa6dnATeR1c2dRNHaaxRU6rb7rqwyIXZOaSxH/+E5UV+HelYZ+ceIjwH5Jaxu
	8KooB8qHBkMqfsf2w+VxT+og4RlV1MLXaEA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9c0c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 16:16:54 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ece7e4af28so857195e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795018614; x=1795623414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iTvIF9xRP0uN+SwNc6JxvB4VOROFp75+Uu1hHT20jpo=;
        b=ZDZWfroiLjja3PlYAx5sp1BKsnHSSTWPNIVR6mLP2jcjiuvCHQq3vG1C7/IQJ2frPY
         FKYgCafoQAk3wl+NFajANkYVPQy6ryey0z71zxn2tszJmcNruJGZwqQHeOFTwOABSddu
         L2weKpGgJZVQEAaAwupcR/HIyNs1HKd7otrCp31yw4euGQsLJ5kF7Fb12MQeOJmVrDhm
         K6kj6YAfoXrWwVVdCW13/0dkjmvCKUddaoHK/mL4bKFzmXnM2DD5YSViMr2ukMkQV6DM
         HgCTtqPxy5SXrUV+H8GN7DQh7f7Yw8l27PeL6On/ubAupvT41e7bliZsYy0lmRjTkQdp
         Bqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018614; x=1795623414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTvIF9xRP0uN+SwNc6JxvB4VOROFp75+Uu1hHT20jpo=;
        b=o2o/CpFvek9ST5hSFekD00WuKevFemACaXDrbsPlMooKrx07Al/W7kx1zQswFdLduJ
         aiqBakJAhaL0vf4QsSgzOR8PhkA29w2ntU1UNm+Bk3RJuhH+cmB8Y0bon8kEZ30xDxh+
         KeO0MHhekbCz3rtiwojTe+t5fpSZRX+3ycH+equxOa3cuGmRMAel16LrptBeW8Twibcq
         TCk5y4Xo1hGp3cnf6XtrJZCHedneRSUxSt4ieM1xdZ3GpyKsJHOH1jrD1RmnhJ07Fmoc
         KYwqH+qKpecPFj74gPsnhOnYAdQir4RTLm23H9ZnC3Anxfrf5CnTSXzF7OFo7EH5rfOF
         BOfQ==
X-Forwarded-Encrypted: i=1; AL+hErEP9426ycEVFHh6mArtCGhGi63OJneHC/qDeYbC2IU8v4G6mdErvWS293OWfJP5PX6gCGE6r+Dj4FrHIu8TomuZ@lists.infradead.org
X-Gm-Message-State: APuU4Z8P3EHVratzKq5GSDEe/b06DikWZ1ZfHj+LAklUGLIVEyhRd75X
	GDfhlPoYUh3Ro19S10+sWNZo/PAcFeT9Gurwm12X1b1RmBxepSOFYCwDb3SVkedX1mnyzTfegKt
	eCcyhcVEHxRRiFrQjNjArmuPy594gFkon4Jr0gp2vsQ31YDrwAeACAkOVbw6j7DsUqXJwXlxZPj
	KZZQ==
X-Gm-Gg: AYBFou3UonMBh0mxYQut+xAbkjaTIXA+bM/lfTQ01Wbg5ln84lQh37fQM5ecYLCKBs9
	WZ6C2iI1XNylxEC6C+lr5QlfjY8lXM/xcrxZuGeX42yQermsye3gRsCLM7fnGW4UgTXuxhTAnOY
	MvylMV2DEpZsuwrBNxDuiIq+HaDYeyGnFmi9EfEtgS8PLbJXpXCOyZURGnlMjgDczpf4JoRBqyT
	00DieYpImzuvVUfjuhLb5L0LRNNvFP1EXaxH1WtMm2Dao4sXSQeih/MP9EIVNPMl7me/tjykVQC
	2Qigk4qzcDMSqYFq3F/+5ZasXUbRK+wZHQcrb2A3oAhw7Pcf2IMt0L95ySfHfvyhfJ4we4UmVXM
	3qhMOS7m/RQyg2UiaGb1htpAY8E6OInkTh3jiYWXV6uvigtGlGxj16c/5wUJqSJX27pREvuWzWq
	Wt
X-Received: by 2002:a05:6122:1d48:b0:5ea:d2fa:c2e6 with SMTP id 71dfb90a1353d-5ee646fe5e0mr1635591e0c.14.1795018613801;
        Wed, 18 Nov 2026 08:16:53 -0800 (PST)
X-Received: by 2002:a05:6122:1d48:b0:5ea:d2fa:c2e6 with SMTP id 71dfb90a1353d-5ee646fe5e0mr1635579e0c.14.1795018613364;
        Wed, 18 Nov 2026 08:16:53 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d355:fe70:14a0:ac8d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm217090495e9.8.2026.11.18.08.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:16:52 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, tglx@linutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Peter Ziljstra <peterz@infradead.org>,
        Bradley Morgan <brads@mainlining.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
        linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support)
Subject: [PATCH RESEND v2 0/2] powercap: idle_inject: Create threads on demand
Date: Wed, 18 Nov 2026 17:15:25 +0100
Message-ID: <cover.1794992905.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NCBTYWx0ZWRfXyi9q2CIUWMOJ
 GS4CKhfNg4SU0lZUebEgEqXFQQU8CnPotIPLjpnxbgQI4umXWP7NLub4HJ+3mp2JNBDAOkjxafK
 F5bzMOAauzYzDfKG91Br84iFytQln/s=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afdcf76 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8
 a=x1L0ys6JoTQEvF2T-JwA:9 a=vmgOmaN-Xu0dpDh8OwbV:22 a=HkZW87K1Qel5hWWM3VKY:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NCBTYWx0ZWRfX42JwKgfKUnFn
 G2LeHx2z2UR5MSi5o/w3mzmgeVOEWOORzQ6hTaQafPZprSCqr8LceByRMB0iwTWpEEaje11RF0G
 7ffT44rb1nUyUW/hYIAaIzMqu6ySB9KUQUJUh0dpjHM5+MgoNwECNTDPxYFx7SOl2B4Sfwt27Q4
 CXX2qDNtCpjtkyQgNAzjCodVRyr3XJOklaGeYpC+AV8ceND0LR7CQ3+olN6Jffg03skNOm4eprg
 pH76nVJzjudtPBSsfh6cJa5JADUe1+IXa3Tk7yCMK3LlKTqDJEMyaE7g83fHYRhzZwupPRJEl1N
 HH0Vsw3L0fs//FvbDakbrZvyMjksmdz+5r8cKqKCMpTPkENvJdaIpCQLsNu04n7PFHH71IUGRNY
 2nGHtcGeQad8LNzvdgVwtmmyF6A+OzeSX8sZeh9Zr8m5+WqDT+tSpNB2yB4tgcN0981fIrnUkLe
 HMDIwuf2Fm4YPsfPFgw==
X-Proofpoint-ORIG-GUID: cfcYORMSwt8GyXmXn9Nn7_xBAs2Owg5O
X-Proofpoint-GUID: cfcYORMSwt8GyXmXn9Nn7_xBAs2Owg5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_081655_814388_F19B022C 
X-CRM114-Status: GOOD (  15.95  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
Message-ID: <20261118161525.WSZWp-1kraWo5anOQqNPg94Dwo4N8p2XLBR2Mrh9_LQ@z>

Idle injection currently registers per-CPU kernel threads during early
initialization, including on CPUs for which no idle injection device
will be registered.

This series makes thread creation follow the lifetime and CPU mask of
each idle injection device.

The first patch adds an optional CPU mask to smpboot thread descriptors.
The mask restricts thread creation, CPU hotplug handling and teardown,
while preserving the existing behavior for descriptors without a mask.
Registrations sharing task storage are checked for overlapping CPU
masks under smpboot_threads_lock before any threads are created.

The second patch uses this support to register idle injection threads
when a device registers and destroy them when it unregisters. CPU
ownership claims, registration rollback and thread teardown are
serialized to prevent overlapping registrations from sharing threads.

The series was tested on Rockchip RK3588. The updated smpboot code and
idle injection code also build with W=1. Concurrent registration and
CPU hotplug runtime testing remains outstanding.

Changes in v2:
- Reject overlapping smpboot registrations sharing per-CPU task storage
  with WARN_ON_ONCE() and -EBUSY, as suggested by Thomas Gleixner.
- Default a NULL CPU mask to cpu_possible_mask at registration and
  remove redundant NULL-mask checks from the lifecycle helpers.
- Use scoped guards for the smpboot registration locks.
- Document the overlap restriction and registration return values, and
  update the core commit explanation.
- Add Bradley Morgan's Reviewed-by tag to the idle injection patch.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Bradley Morgan <brads@mainlining.org>

Daniel Lezcano (2):
  smpboot: Allow restricting per-CPU threads to a CPU mask
  powercap: idle_inject: Create per-CPU threads on registration

 drivers/powercap/idle_inject.c | 69 +++++++++++++++++++++-------------
 include/linux/smpboot.h        |  6 +++
 kernel/smpboot.c               | 45 +++++++++++++++++-----
 3 files changed, 83 insertions(+), 37 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0

