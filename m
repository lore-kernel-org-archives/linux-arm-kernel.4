Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F045C606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 17:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZnFJaJGA;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=j3zWMcIc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Wux39rVPBd8xHmRs4BPRMKuHJT2lkiWq+nsT5+59exw=; b=ZnFJaJGAF45wOV9qJMrymSQP0X
	x1XkGNm9b7+vzdBQ8mrrVGgO66Rf2jh1BolQhlVmkNGFrhNDC9mL7InXOdTJnVaBX2+ljyntqcZGV
	kjOFPr95trgQgt1hnSecEeIw6ZO2hOG39GselpB88vgjE3ST/JW2rGUAVSgFgoS0WszLc5u/xRw6L
	5Uep/OBalp3TPyyLT+G4xaLGNddvrhIEoLKK3FscrV1cjx7XEYou1svYagx7yI6FbwEWoH3vawKgr
	LDixeNBPG9nX+5X8cisieNzGjidjBIQW+y/fGHU9oLkG8zgWu4RLV+QaHF2Ky3gbRIwUydFi3urSZ
	8QOP31tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCP4-00000007Ked-0GLu;
	Wed, 11 Nov 2026 17:46:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCP1-00000007Kdn-2bDR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 17:46:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20F0D1576;
	Wed, 11 Nov 2026 09:46:26 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4FD43F632;
	Wed, 11 Nov 2026 09:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794419189; bh=XzPMC4L9NkLD1pgowl99MR5uN/bHkG00JpBclqFOIZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j3zWMcIcYAlcXFIdvMucwRr83xNG17WlT17F0tDyRYnbeC/ImKWlIUBHMHbc/sW7+
	 EgEiKp+GoWbXftj6HEJxs/e1Q0J3hHZYt0vwKoKFXlqciWKY8778EhDwERXgzU1Jij
	 ddOMF9mLBR9KNd31ptwA4Y35+sUO60dR3DCKWrIs=
Date: Wed, 11 Nov 2026 17:46:26 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Subject: Re: [PATCH v2 19/23] coresight: trbe: Reload the AUX buffer on
 overflow restart
Message-ID: <20261111174626.GF9176@e132581.arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-19-3f57cf3199b1@arm.com>
 <d93b9120-197d-4b01-a9ab-8df01657716d@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d93b9120-197d-4b01-a9ab-8df01657716d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_094631_756373_2C9E69E4 
X-CRM114-Status: GOOD (  37.49  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 03:12:06PM +0000, James Clark wrote:
> 
> On 16/10/2026 17:55, Leo Yan wrote:
> > PERF_EVENT_IOC_SET_OUTPUT lets events share another event's mapped output
> > buffer. For AUX events, this also selects the associated AUX area and
> > sink configuration. Perf normally establishes this sharing during setup.
> > 
> > Consider the following hypothetical live-redirection sequence, permitted
> > by the inspected perf-core paths. P is a parent event and C is its
> > inherited event, with C->parent = P. A and B are mapped AUX destination
> > buffers owned by separate, disabled cs_etm events in different task
> > contexts. All three are per-task events restricted to the same CPU, with
> > compatible output settings. P has no mmap of its own, allowing its output
> > to be redirected while A and B remain mapped through their owner events.
> > 
> > 1. P's output is redirected to A. C inherits from P and begins tracing
> >     on the selected CPU, so its open AUX transaction and TRBE hardware
> >     both use A. P can be inactive while C is running because their
> >     events are scheduled with their respective tasks.
> > 2. A userspace controller calls PERF_EVENT_IOC_SET_OUTPUT on P to select
> >     B. ring_buffer_attach() calls perf_event_stop(P, 0), which returns for
> >     inactive P without stopping C. P->rb now selects B, but C's existing
> >     handle and hardware still use A.
> > 3. C's next buffer overflow invokes trbe_handle_overflow() from the IRQ
> >     handler. It saves buf for A, ends that AUX transaction, then calls
> >     perf_aux_output_begin(handle, C). AUX begin follows C->parent and
> >     reads P's current rb, rebinding the same handle to B.
> > 
> > This is a hypothetical API sequence, not a reproduced TRBE failure or
> > an observed buffer switch in normal perf record operation.
> > 
> > Without reloading buf, __arm_trbe_enable() calculates the next buffer
> > using B through the handle, but its workaround and hardware setup still
> > receive A. If B has never been enabled, its missing CPU association can
> > cause the normal-offset calculation to dereference NULL. With a snapshot
> > buffer, hardware may instead keep using A while perf accounts output to B.
> > 
> > Reload the sink configuration after perf_aux_output_begin() so the buffer
> > and handle refer to the same AUX transaction. If the buffer is missing or
> > its CPU association does not match the interrupt's CPU data, truncate the
> > new transaction and leave TRBE disabled. Truncation requests perf to stop
> > the event; a subsequent normal restart installs the buffer and its CPU
> > association through the sink enable path.
> > 
> > Stopping inherited writers during output redirection remains a separate
> > perf-core fix.
> > 
> 
> Shouldn't we do that instead of this? It seems much better to fix this in
> perf core rather than here which is hard to understand and appears to be a
> bit hacky, and doesn't apply to all users of aux buffers. I would expect
> that even when using PERF_EVENT_IOC_SET_OUTPUT, the buffer should be
> consistent between start and stops from the point of view of individual
> drivers.

This is only a hypothetical scenario. Fixing common issues in perf core
is right thing to do, but I'd rather not spend time on this until we
can identify a real-world case.

> It makes sense to add a workaround in the driver if we can't
> control that behavior, but the code is in the same repo. Maybe we could even
> just leave this patch out and do the core fix later?

Let's see the simplified flow:

  trbe_handle_overflow() {

    buf = etm_perf_sink_config(handle);

    ...

    perf_aux_output_end(handle, size);
    event_data = perf_aux_output_begin(handle, event);

    buf = etm_perf_sink_config(handle);

    ...
  }

The overflow handler ends one AUX transaction and starts another.
Although perf_aux_output_begin() returns updated event_data,
the buf pointer still refers to the old buffer, potentially causing
a mismatch in the hypothetical scenario.

In contrast, Intel PT and SPE use the updated buffer pointer returned
by perf_aux_output_begin() to program the hardware, so they don't
have the same issue.

> Unrelated to this, the sashiko report that says there is an out of bounds
> read if the output is switched to an ETF buffer seems to be pre-existing.
> But it's something worth thinking about.

I roughly remembered the comment mentioned a race condtion due to swap
TRBE and ETF buffer _within_ the same session. I don't think this will
happen. (I will double check Sashiko comment).

Thanks,
Leo

