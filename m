Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E69F606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YZP2+zJL;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsUiiGMG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WQwCcV8p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iTvIF9xRP0uN+SwNc6JxvB4VOROFp75+Uu1hHT20jpo=; b=YZP2+zJLXTA030F1Tc+hHZh78N
	TK2GzwtgqJe7jZkC/079QZRT7+V23ZWu+Z+628QRBIb1g8HTVfB+hNSo/KSwBjS7fT74Y2ZU6pV99
	tILW1e6y6+5y3ybkqdkAQJgf1G7R1L3oMFY+Y4hEFxSKw85oPiE+TiM53TCDXfqOjr7MG8+xjkDCI
	lY4BwpK/0ITQR6MZTVQo2AjPFInkfwGGO4iVK7dLWr+vR1/fqvPw+T/yUssS0ys6+9+ZNYkurOHiO
	skKwQEGWnyfEfnoRGWgy8wj/GD5NRxVZ2o0r1uAq5STa5czH0EcKMslf6M5oJBjZ3h3fUpPoltzSh
	iW01RlVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTczb-00000008ZHV-0SIz;
	Wed, 18 Nov 2026 10:34:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTczW-00000008ZDT-1scr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 10:34:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9kIAN4082362
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iTvIF9xRP0uN+SwNc6JxvB4VOROFp75+Uu1
	hHT20jpo=; b=SsUiiGMGFDjlwS1UaGh9zeibIhBketuh9WeA49mEAL/ADORES8Y
	iUbrjH1tJGc3PL2ha38JwViu7+QmcF0G4Recl2WhEJV5hc6D/NV9kTmayG5a0T2/
	silql2KTqHKgTfd0IWSMWqNr8hZUDk/fcG381Qf8VVQ+Rt8S5BS40qzEGJ6t47vF
	ZnBnUK/5ubwdzebofwo9ndz4R1GtIxp1Q3NEl9EbK9fzc+iTnE6WGgzQRjN4sQ3y
	uMcJo+WcNQaS3QUCxzx8W0Ln5vpeYkWHf7x3rVVWoh+kzrfVWYRcho4md75VWERd
	9KV7rEp3FuGLUS6XOrx8KajCHFpWECHXF3w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9jhap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:34:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94961511b61so171542385a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 02:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794998052; x=1795602852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iTvIF9xRP0uN+SwNc6JxvB4VOROFp75+Uu1hHT20jpo=;
        b=WQwCcV8p0tpAdrPnOccqoa56ezbIV4+JlFdT2hYf8Tbv6it1n5y2OnHufOa/GQHi7g
         nRhmbFGaXIhUX0Pc9KP33WcUztY0ejVXmcSQWwTnAdB87A8KMG14FsuD6Lv5ykKnCXna
         HQdK9kM4nIlv8VmTKAgh1VibFhwV7miWnr6s2UKASMF3rMNZU+TWGNwDDcQZuSi9hIQL
         Ov6im1TYz47VdEHe/A1RYWh5lh8O1bu5y+va0a7zxfudJu2rfGMHTB9oAyWL/3ENIiFd
         6nQNuxDiQSxu4AIiZRZdg3ZYaseH94g8xcInG1AQ6Oa3kFAXeGnDra/zpuTUWgfHYosA
         RnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998052; x=1795602852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTvIF9xRP0uN+SwNc6JxvB4VOROFp75+Uu1hHT20jpo=;
        b=VEvav3PjRb4JTKNi9UlZU+S49HJoOmyfhRzKx+kEdU+8DPTs5E8vyBNzvQfMgZzGun
         xUXIdceS+mqbUTSXzN9Lue7TjLUNNsTNgNgr6npF17NOCijtNt3NUHO8ibtO/lXHFE9n
         MeLTIDCPfUkRnj+lrxtPJNlc2hFBmR31/u68TuotYqTpx5qkOcPPqmxusovb7e+aepsB
         /qyge12ww0STSGM5UpeVXPpYcDH4LLslYPxWJg1twNDrqyVZRkCKQ4xwgaQobdjJMteN
         8igR/ORJqVaJO+WNUOKBy2g+B7BXS7fmWBAvvoDmLbFoN1BRKEvcz9dsmpCyXDDaI+UM
         6HKQ==
X-Forwarded-Encrypted: i=1; AL+hErEdvLPMMwGF4VRhZpCkKyctOrsGCfBJRiFQ/YiUVB/s4xYL95YSYqo8Kx2I0bIjKO0ZqSzJyp4Qaw6+RWoEFER9@lists.infradead.org
X-Gm-Message-State: APuU4Z/HLPJMinb2zSksozCC7AxIMe8A44i65T42tDsnaBuHD/DKqGC/
	P0sJdySG4tOpDcflU2hdxeSEvk3+59bCULq2zv6sQJfpIBUrF3u9ci+nKqsePRNynagcZnDB2vK
	zVqdHg8R+yGZCHqlGc8yhKQmUerfZpz31RFhAYw8FCQhdDCD8Q8WIcrY9bPM02ZRto+NTXTt22G
	R5EDrENPpWKOSX
X-Gm-Gg: AYBFou1PWBHwYvRpO3nJobAWTPjczF9btRsxDAtFUtRaPz1U/RV3HRJof63SpeOxS0S
	N0EocFgMhSKL5mF0Rxp1zGij9dbv+ctwmzKWYD+Wed+2VQkmfrlZUvQH2NC5XL0gr/GBbK0On0X
	zvu84Js1/Llf5tygHWrTjIutBhmN9Y9eKgU3NLjkJIC1RC5UnGRq4ZBWtHwLuDxf/0mxCxBnHIN
	Q7i4OJQBhfI0HpDxXe+98dNu0BRmRQxTyZBdnOqqjnRmELgTvWEr2X9ZNxS1oo5PqGiZzUUwBOA
	Q/4c5x2EOcItDVT3S1AJs+15mFLLPQPvGM7Llvb6t+QXQz3HfpXQQXMkvTfeiY7gAPna/9E92dV
	o0O8M82QrfqpnWT/1/STTOACbPapKSNsD2qVzLCpBNEaXYpZvORjOrLp5UMla7Y0e82ZQtyS9LN
	qu
X-Received: by 2002:a05:620a:3710:b0:949:6ece:8aff with SMTP id af79cd13be357-94999769dfbmr380051285a.55.1794998051875;
        Wed, 18 Nov 2026 02:34:11 -0800 (PST)
X-Received: by 2002:a05:620a:3710:b0:949:6ece:8aff with SMTP id af79cd13be357-94999769dfbmr380046785a.55.1794998051378;
        Wed, 18 Nov 2026 02:34:11 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d355:fe70:14a0:ac8d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2ecd0sm4519631f8f.8.2026.11.18.02.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:34:10 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, tglx@linutronix.de
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Peter Ziljstra <peterz@infradead.org>,
        Bradley Morgan <brads@mainlining.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
        linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support)
Subject: [PATCH v2 0/2] powercap: idle_inject: Create threads on demand
Date: Wed, 18 Nov 2026 11:33:47 +0100
Message-ID: <cover.1794992905.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yjlqAcK_jUBg1yIxZezIFdT_5oV3fIJU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0MSBTYWx0ZWRfX0T1475/myVXy
 ww96Ebc7wVitGkajko+ucMdXECtpVIGvBE3l1qRmBTEP+4X0JsgM9ib0bHmi2rpx/mPlHcnVXdi
 M8asjhOtVOqvrb7EDKjpJPB2TYj4u6c=
X-Proofpoint-ORIG-GUID: yjlqAcK_jUBg1yIxZezIFdT_5oV3fIJU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0MSBTYWx0ZWRfX0ikY27fCtjS8
 4/DDSXB9+obPfOwChcaRvnG1efee+cqdSNC0R7va6d7s/XXZMTwPU9v9jnsgaaP1XMhFqStHXzM
 t2FJF8+lFfXX071dq9x6X6Ujq2akfB1MWHwBO0luKhsMDnUpn8psjf6sMrTcJgWAfp5bmZXdbug
 gWJCbLQlvCME4PsLlihSbzFwpFOMHLwO7L7/Gf/IH/RIM4jzcXA2lewLA4utToIozUm9ds/q6wR
 V0T4P/T0mzwpvH4Va1PwYsfklLIYH5VzpU9VEVpsBU4Q99+/EIgxSc3wSyoxkiv1QUib/URcP4h
 xFwuzdp7UpaKaRbUmktTgEsqgcMEKeDIDAPLDBaMeNnXXfCoC8AxsfUN9X4jZeErfqYAW93KSXc
 K0DG2nGjmBlzlpUnssYa4agtKThEhTAKdgNlO502It/uGRvZNdtY9FOJ8zQytvVzPLU2LvTaZfA
 Wb2xpbOUT7rcmK2wEIQ==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd7f24 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8
 a=x1L0ys6JoTQEvF2T-JwA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=HkZW87K1Qel5hWWM3VKY:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_023414_597307_D14C6524 
X-CRM114-Status: GOOD (  16.45  )
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

