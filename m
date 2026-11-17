Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B89606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 23:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sM2oFWRa;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nxjkvMDJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YYOHGdo2Uum+V1fQIyTYxRpM9Fq04ij2FJz0fEEop/4=; b=sM2oFWRakNIO5jz0XFJvCeOQFy
	WgTjNPftxX1dDF/NP0FefbgknwRQEkyVrYiASDcLLFM8/sSo4q5dO3DHGDy3D56931lIqa5bHb0cB
	rAOQKZNa2Myz7x5IGz+8I5Y5LD2B2V55gNqAqGaEEvYwbqcfHiH7ulqfAJTEP79Gd9kku+7DshMk3
	h1uuS5zUJl0FNtyoOktSzmgu9wsb89mzWc/UCHofDIcOWnIOEH8OLdsodFp9X8Bsd5IkKfrHsC4ej
	PaPKqRpnTkxmqI+NWaZ8Ezlm7g0riXKUQiuyP0uorTShb4cLZpipGZxbI5AoFAwW1k2rsgXA0tdfZ
	EUSwbnjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTT4e-00000007Kcv-49km;
	Tue, 17 Nov 2026 23:58:53 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTT4b-00000007KcY-0xMc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 23:58:51 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2e9995ce866so2812845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 15:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794959928; x=1795564728; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YYOHGdo2Uum+V1fQIyTYxRpM9Fq04ij2FJz0fEEop/4=;
        b=nxjkvMDJgE00HJCnrJqMnYExzT0omZUpDta0T/yX7OZuYZqizDdXxbnFvCR0j1lAO5
         OxmBgE3T68YUYDwlVGIDCj4T1iUyOGzO5jpinGpMMbmut7SJeG6ErZ7QgiRqSta5QVJy
         bMEouumpLTKBWAooXs7ztEgkfeFnjne36ktziV910WYnMQ/MZ//yCODrCicYv4qeLAvj
         IpWsmwq4K0Kl4jMVdQM5GZJH179TTTVRcOCn8scMbFRJpDCu/ADpO6pkzMpgc93tubi1
         40kKslaKVM7AOewQZ+aKt0/uwqQqFHpZ5TDG7vZLvoTIMSh7RPHtmFj/KjKFAiKcqbsB
         Xezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794959928; x=1795564728;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YYOHGdo2Uum+V1fQIyTYxRpM9Fq04ij2FJz0fEEop/4=;
        b=e6m4NMqkflQZqbvYmL2LQ3+E/DgO6aJMq34tvkFs5l+DiFBjSbHqcpmk1j5H4yCqaQ
         owojjar68IEuSmpQHUlsfhPg7r0WM94FjexWtatITGNrb+Jqu0eU6MgJd6z1/gsnDdeY
         yjkpGu/KYBzFR2E+3tuU3GKZ7SeblXSrVNN+K3JZXItqlzwJeeTTRbpzI4Ykq++x0wNr
         0m+CYvXC0JeqJY/vmQ0DuykARrH35puox+/PKtV/XcXpT68W+iHMiau1G+wwizq4KBsT
         Yg9lvbXxNHKVijFJQ+10827FnjyYdQv9XEoUBKN0fho7zX4fxDl/zXA5NxnUf2nGGouD
         s0vg==
X-Forwarded-Encrypted: i=1; AL+hErHXuCsLQSIPZTSgBlaUzhO/yvR5QZYo26UgjNZ5b2Vn8TKiaotSKBXz/ItomxL+KSW/ruyivfk0UEJRpF0XvOvP@lists.infradead.org
X-Gm-Message-State: APuU4Z93JVpaqG1zl4NcA2UsMzNR3qglL2q7gSvE6GYjiId+FNhe32WI
	Ufs+ZZFMB0H5La6imOpoxymkmbojnUSnazvzlxSWF6kSy6wNgOox+wVfTOh0AJlkrqU=
X-Gm-Gg: AZFdTZcpUGBkxVkdYjQIFj8p/8+bchGDu9AT30MQLaBxeWGKl9vstgbWqYVrl4lUrpa
	kiVTBY/KbK7jkPRdhbcmpb8MSiwZ1B+8u5YQ7vRZ1duoXvD3HmuxSi7ru7XT7Ni5BsP50bL7E+2
	y/w/q4OrqBsUjpw6u39LHBRnB4NSdVvVt8OhPt+kpKR1tQpqhTC8EotnFvOXIUw83TCVMhF2IQD
	E6hMs7LGF73+Ba9aS3Fg1CFVJhxWyfr0wReEArGHGOILys5U/cNCrJFmQwtgjIhmjfSxuwz3z7m
	BqtuT3OEjKKx912bregDLaHcZ5xKQB2XYiaE1mzc15bvJcA2fg0kloifJ+m+bC5EFNob+WQy5Sf
	m8aUXTZqp/O1EL5zBP80W18rhBf7ULHv4l3zVCP1f9VB4lHYenqB/ficKN94Vq+6LXAkcd0iSby
	HRv04GBRl3dm3PRxGa0ysmgmp3xHDZAGEcEUN6pJebA5h1OkCdAmN6RWvtxcsc9RwlmtpAb629G
	Yldomv1w5B3EfvKKUBxm26CK6uhTtc+NhxNieIGEJ2DjIqpWNvv4ZetixAc1Pil6A7rssL31Efi
	X1y65oI5UoItYIGAPVOCvc5P
X-Received: by 2002:a17:903:94b:b0:2ed:56ee:af8f with SMTP id d9443c01a7336-2eff720def1mr8355735ad.2.1794959927638;
        Tue, 17 Nov 2026 15:58:47 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2eff627f421sm3482425ad.57.2026.11.17.15.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:58:47 -0800 (PST)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Tue, 17 Nov 2026 15:58:39 -0800
Subject: [PATCH v2] cpuidle: psci: Allow domain idle states in s2idle for
 all CPU idle states
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-topic-lpm-psci-domain-callbacks-v2-1-744884105846@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAC7q/GoC/42OQW7CMBBFrxLNuoPiEBrCintULMbjCQxN4mCbq
 Ajl7jWhB+jyS+//958QJahEOBRPCDJrVD/mUH0UwBcaz4LqcoaqrD7L/dZg8pMy9tOAU2RF5wf
 SEZn63hJ/R6Q9dSW7xnXbHeSVKUinP6vh6/TO8W6vwuk1+0cEud2zOr0xsBQF2Q+DpkMxN5saA
 xt4tS8akw+P9e5sVvjfz2aDBmuqG9fuuOWmPVp69GqDbLILTsuy/AIKK0S/DwEAAA==
X-Change-ID: 20260831-topic-lpm-psci-domain-callbacks-a8af0cd7df35
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Scaria Kochidanadu <s-kochidanadu@ti.com>, 
 Maulik Shah <maulik.shah@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5783; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=guTL8dYKPlJDgX26UnFRsZQN38nxU1WkErfhyeEPhdM=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBq/Oo2kY6Xp4ijMAORZ44kIfExylSsinOdQLrlr
 I1XRTaDEm2JAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCavzqNgAKCRBZNxia0/vG
 ZZ5uEACN+j6ErUSQKd6/XHskcSMq5MnnSxTmTrPatCH4tYKEUJNPOrG5zWSTcTLTAZdPgn5VgDf
 Ig0T8XJpi7ayBiooduqu9FnhalqW2uP7kXccZNkMf5UOLYrL5y9TutrJdBRdFmPWwRYr8A0zfSS
 qCI5xiNbiBU7ZJSAIQXVq9mCrbk3TOC552QMPGk5DmXllVNDN4pICYbPeA8QhyhKQH9Df0KaebV
 E0g7ZZMiCOVGKloVt0xqOfGUviNq9vg71x1gnXfRqXK8XvXwQmSsPnxc4hw5F09rUqPps2BrOqz
 rgJxV1C5V43JTTIkm4ki2UzxUzedu3bemeyPPGY0Tr+cSdiv6o79/pFzsQku+t6kStelDqJJmwN
 QstYw3eXWJXKgPqQtTBTyK/cfm4kfXxi7gJKjBvG6BNsBc01u15bq6/KrKufKmS/4POGxsuSjJC
 t+d8LRaZ6cVa4BEAfIAsUCxyoLvEekEcgdfC3eMx2CoWcQO3VmGflHZ/bO9Q5IX2pe6/aw1tO40
 jNPUMuEzXSoJn9WfrHQUz7VzVypheFW/0+amYr2zsUyWU2NWRzsM80ZVSrl+eQJNidczBpVYHNP
 tHd2wXP7x3DzyQ73TI3JPOjZWWB/AiyLlHXPMpl5enJd+en/cwBY2SoCTWKE/BzbdtNZwshBFFh
 oyKgJP1Zhj/tRig==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_155849_305730_4B9D1684 
X-CRM114-Status: GOOD (  24.21  )
X-Spam-Score: -2.1 (--)
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

Currently, only the deepest CPU idle state has its ->enter_s2idle()
callback set to the domain-aware psci_enter_s2idle_domain_idle_state().
The other CPU idle states use psci_enter_idle_state(), which bypasses
the PM domain entirely.

During s2idle, the CPU idle state is selected by find_deepest_state(),
constrained by the CPU wakeup latency QoS limit. If that limit excludes
the deepest CPU idle state, a shallower state is selected, and the CPU
PM domain hierarchy is never powered off. As a result, no domain idle
state can be entered, even if some of them are within the QoS limit.

Fix this by assigning the domain-aware ->enter_s2idle() callback to all
CPU idle states, except WFI. This is safe for s2idle because:

 - The genpd governor selects the domain idle state in
   cpu_system_power_down_ok(), using the same CPU wakeup latency QoS
   limit that constrains the CPU idle state selection, or a stricter
   one if a device in the domain has a system-wide resume latency
   constraint.

 - There is no idle duration prediction involved in s2idle. Both the
   CPU idle state and the domain idle state are simply the deepest ones
   allowed by the QoS limit, so the genpd governor can't override a
   decision made by the cpuidle governor.

The domain idle state's arm,psci-suspend-param is a composite state that
overrides the CPU idle state, so the exit latency of the domain idle
state must account for the complete composite state.

The regular idle path is left unchanged, so only the deepest CPU idle
state can trigger the selection of a domain idle state, as the domain
idle states are assumed to be deeper than the deepest CPU idle state.
Extending this to the shallower CPU idle states isn't safe. The cpuidle
governor may select a shallower CPU idle state, based on its predicted
idle duration. The genpd governor isn't aware of that, as it only
considers the next timer event, so it could select a domain idle state
that overrides the shallower CPU idle state with a deeper composite
state.

Suggested-by: Scaria Kochidanadu <s-kochidanadu@ti.com>
Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
v1 assigned the domain-aware callbacks to all CPU idle states, for both
the regular idle path and s2idle. As pointed out by Ulf, that breaks
the current contract with genpd for the regular idle path, since the
genpd governor isn't aware of the CPU idle state selected by the
cpuidle governor.

As discussed with Ulf at LPC, this v2 takes an initial step by limiting
the change to s2idle, where both the CPU idle state and the domain idle
state are selected based only on the CPU wakeup latency QoS limit.

This pairs well with Maulik's series [1] adding support for domain idle
states that are only allowed during system suspend (system-state). Along
with this patch, platforms can describe several s2idle-only domain idle
states, and select between them via the CPU wakeup latency QoS limit,
even when that limit excludes the deepest CPU idle state. There is no
build or runtime dependency between the two series though.

[1] https://lore.kernel.org/r/20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com
---
Changes in v2:
- Limit the change to s2idle; keep the regular idle path using the
  domain-aware callback only for the deepest CPU idle state (Ulf)
- Reword commit message, fix incorrect claim that no other CPU idle
  state has ->enter_s2idle() set
- Link to v1: https://patch.msgid.link/20260831-topic-lpm-psci-domain-callbacks-v1-1-4a47d95c9c79@baylibre.com
---
 drivers/cpuidle/cpuidle-psci.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index 0187d6a9096a..01a571479e5c 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -250,6 +250,8 @@ static int psci_dt_cpu_init_topology(struct cpuidle_driver *drv,
 				     struct psci_cpuidle_data *data,
 				     unsigned int state_count, int cpu)
 {
+	int i;
+
 	/* Currently limit the hierarchical topology to be used in OSI mode. */
 	if (!psci_has_osi_support())
 		return 0;
@@ -261,12 +263,21 @@ static int psci_dt_cpu_init_topology(struct cpuidle_driver *drv,
 	psci_cpuidle_use_syscore = true;
 
 	/*
-	 * Using the deepest state for the CPU to trigger a potential selection
-	 * of a shared state for the domain, assumes the domain states are all
-	 * deeper states. On PREEMPT_RT the hierarchical topology is limited to
-	 * s2ram and s2idle.
+	 * For s2idle, use the domain-aware callback for all CPU idle states
+	 * except WFI. The CPU idle state is selected by find_deepest_state()
+	 * and the domain idle state by the genpd governor, both constrained
+	 * by the same CPU wakeup latency QoS limit. Hence, if the deepest CPU
+	 * idle state is excluded by the QoS limit, the domain may still enter
+	 * a domain idle state that fits the limit.
+	 *
+	 * For the regular idle path, only use the deepest CPU idle state to
+	 * trigger a potential selection of a shared state for the domain, as
+	 * the domain states are assumed to be deeper states. On PREEMPT_RT
+	 * the hierarchical topology is limited to s2ram and s2idle.
 	 */
-	drv->states[state_count - 1].enter_s2idle = psci_enter_s2idle_domain_idle_state;
+	for (i = 1; i < state_count; i++)
+		drv->states[i].enter_s2idle = psci_enter_s2idle_domain_idle_state;
+
 	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
 		drv->states[state_count - 1].enter = psci_enter_domain_idle_state;
 

---
base-commit: bc71431221f5ba8bb33918399552636e059c2c45
change-id: 20260831-topic-lpm-psci-domain-callbacks-a8af0cd7df35

Best regards,
--  
Kevin Hilman (TI) <khilman@baylibre.com>


