Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFBD606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 10:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k8/9ODj/;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cPvNv0hE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/HN5Oid87KZ1UD/wdD52UhmT1nmCHZ1TRAIR8tvOh2M=; b=k8/9ODj/EVcUrz
	WUUbrODqa81hWQ9uVMsc3GMJP8iHnLL/6wE84g1lTjBecgtKArjJoWkzmTsCLJ9M1v+oUeykACA2T
	QR19ihmK63e/I2M8Nlc3mDX+VGUiBnq8C7/czdaJV69bcNjhw52A/hEvqWSD+u9bvrjA2BAh5xik3
	9/QMhPpCm5wCXXhZJHlu69ojoYsB0WuB6sUr4UVjAuVfdIovc+TLDqD7db0iSj1iByu3VuMq6o+SI
	mzMVyb75G80qVaSDOFyyTvqFoOANUN0ZSVyjZC626mGi/WuGq0FmcxlVDL8z+MNmiN9IF4U3JPV+n
	LgK4dN3+3QScy0wd7Iwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWc9-0000000CjKO-1cZr;
	Thu, 26 Nov 2026 10:22:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWc4-0000000CjJ2-3rU1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 10:22:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DD2F1BA8;
	Thu, 26 Nov 2026 02:21:57 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 15D133F86C;
	Thu, 26 Nov 2026 02:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795688519; bh=n9K4p8/F3VmtWDVOdaOe+f8q5Aq6mjeHJReQa1J1s5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cPvNv0hEynkrWOOaA8TmOEaPK6UAqpsuL6HCvsVyJildD+dzukAovLaRVPH79K70N
	 4/Vcj0Mm/LMuV09HGYhIGE3Z7kucK++zIb+DRc1rlqbeoA5Yp2NFu9+J/zNrlyGRXX
	 p28V91wz+a1dVilO2tpE3ti5Il9DzEA8BNT0U7rQ=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Vlad Poenaru <vlad.wing@gmail.com>,
	Amir Ayupov <aaupov@fb.com>,
	Suyash Mahar <smahar@meta.com>,
	Song Liu <song@kernel.org>,
	Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: perf: End AUX output when an event is throttled
Date: Thu, 26 Nov 2026 10:21:49 +0000
Message-ID: <179568849229.76239.2933508660598702367.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124-arm_cs_fix_throttling_oops-v1-1-3ad1dfad0159@arm.com>
References: <20261124-arm_cs_fix_throttling_oops-v1-1-3ad1dfad0159@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_022201_035076_1A23C5A0 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 24 Nov 2026 12:00:25 +0000, Leo Yan wrote:
> Perf throttles a group by calling each event's PMU stop callback with
> flags set to zero. On a CPU with a trace path, ETM stops tracing and
> leaves the AUX transaction open because PERF_EF_UPDATE is clear. When
> perf unthrottles the event, perf_aux_output_begin() warns because
> aux_nest is still set.
> 
>   [  181.161897] ------------[ cut here ]------------
>   [  181.161906] WARNING: kernel/events/ring_buffer.c:415 at perf_aux_output_begin+0x1dc/0x1f0, CPU#0:2
>   [  181.234120] arm-scmi arm-scmi.1.auto: timed out in resp(caller: do_xfer+0x1a0/0x558)
>   [  181.234223] cpufreq: __target_index: Failed to change cpu frequency: -110
>   [  181.286675] Modules linked in: panfrost tda9950 hdlcd tda998x drm_shmem_helper drm_client_lib cect
>   [  181.314139] CPU: 0 UID: 0 PID: 352 Comm: perf Not tainted 7.1.0-rc1-00058-gdca922e019dd-dirty #11
>   [  181.323915] Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development Platform, B5
>   [  181.334732] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>   [  181.341721] pc : perf_aux_output_begin+0x1dc/0x1f0
>   [  181.346547] lr : perf_aux_output_begin+0x9c/0x1f0
>   [  181.351280] sp : ffff800080003be0
>   [  181.354606] x29: ffff800080003be0 x28: ffff0008023fc000 x27: ffff4b45d287f000
>   [  181.361789] x26: ffff0009764787a8 x25: 0000000000000000 x24: ffff00080dc99710
>   [  181.368970] x23: ffffb4c334553000 x22: 0000000000000001 x21: ffff00080dc99710
>   [  181.376151] x20: ffff0009764787a8 x19: ffff000801cc6000 x18: 00000000ffffffff
>   [  181.383332] x17: 0000000000000000 x16: ffffb4c3a118c998 x15: 0000000000000000
>   [  181.390512] x14: 00003d0900000000 x13: 00000001ffff006e x12: 696765625f747570
>   [  181.397692] x11: ffffb4c3a52758d8 x10: 0000000000000108 x9 : ffffb4c3a117f620
>   [  181.404873] x8 : ffff800080003a58 x7 : ffff000808de4000 x6 : 00000000000fffff
>   [  181.412053] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
>   [  181.419232] x2 : 0000000000000007 x1 : 0000000000000000 x0 : 0000000000000007
>   [  181.426411] Call trace:
>   [  181.428868]  perf_aux_output_begin+0x1dc/0x1f0 (P)
>   [  181.433692]  etm_event_start+0xdc/0x290 [coresight]
>   [  181.438665]  perf_event_unthrottle+0x70/0xa8
>   [  181.442964]  perf_event_unthrottle_group+0x40/0x170
>   [  181.447871]  perf_adjust_freq_unthr_events+0x178/0x1a8
>   [  181.453038]  perf_adjust_freq_unthr_context+0x74/0xf8
>   [  181.458120]  perf_event_task_tick+0xa8/0x290
>   [  181.462418]  sched_tick+0x144/0x2c8
>   [  181.465937]  update_process_times+0xc0/0x198
> 
> [...]

Applied, thanks!

[1/1] coresight: perf: End AUX output when an event is throttled
      https://git.kernel.org/coresight/c/b7d7462c7f97

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

