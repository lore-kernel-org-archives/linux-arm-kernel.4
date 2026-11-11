Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA6B606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dSGXB2o6;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hWKMs90a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ETLK+DdRn6kk3hBhCehC77zb6MlX1fYlnjRI7fCs/qI=; b=dSGXB2o6Fdw0xh0tKQ5vdTnynQ
	gXU8cY69B7VhL65a5xqfrIjON3EeMazEmd94CftGjUSmd8ZqohWRiHdyBKQQnuir0Irsy16OERcKc
	C9ezvOTmH2NAYDq7w6djPKSrSx0swGO0s0OYODD1Y2g/1aNmaibglyWRJrYXuC5ykDRE0o49QIJkd
	9lQgEM9ufMI3nRZ4sokivSc0DRMd2CkBrCUE5NEjGDpaHFkyNWAj44moBLPCS/0Q/M8Fq1WQAgk9n
	RBTzhfHbPCpUgyuAcr5xTXk3EH1Yv5O6dbUSlLybctyB+Uxu1UlZ3lHoz8WIt7HqCkBexr/OWu6SS
	rI9ioNTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRApO-000000078wD-1fDE;
	Wed, 11 Nov 2026 16:05:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRApJ-000000078vY-1SqH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:05:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65BB71576;
	Wed, 11 Nov 2026 08:05:28 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08F243F632;
	Wed, 11 Nov 2026 08:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794413131; bh=cArNf3uUSKVbLUajKxvLX5GaeGbikslkFdj5wW0Ifmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hWKMs90aLMdy6znrh1MOx8J6w8p2Rrk28zPzUaaOLO5OXdhVlHkhARHeS0kw7qM93
	 3ChJlPjAd3S18By/iASWJGDvBEmY3F+mASN7ndhWjvD4JX6JtYDcARl6Mq3vcdX4Nd
	 /XZDQDXliJ3qhjsrFU83okn3skb9WTazu7TYKrPU=
Date: Wed, 11 Nov 2026 16:05:28 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org
Subject: Re: [PATCH v2 15/23] coresight: trbe: Report truncated trace on
 buffer update errors
Message-ID: <20261111160528.GD9176@e132581.arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-15-3f57cf3199b1@arm.com>
 <57ca748e-127d-45a6-a662-fc1cb9895b51@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57ca748e-127d-45a6-a662-fc1cb9895b51@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_080533_538127_A4FBA21D 
X-CRM114-Status: GOOD (  12.61  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 10:47:10AM +0000, Suzuki K Poulose wrote:

> > @@ -903,6 +903,7 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
> >   		 * errors and as such buffer is empty.
> >   		 */
> >   		if (act != TRBE_FAULT_ACT_WRAP) {
> > +			perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
> 
> Do we need this though ? If the buffer has space left, we shouldn't use
> TRUNCATED. TRUNCATED causes the event to be stopped and the userspace
> needs to re-enable the event.

Here setting TRUNCATED flag is intentional for fatal faults. The following
patch restricts this handling to TRBE_FAULT_ACT_FATAL only.

We can consider this from two perspectives:

 1. We distinguish TRUNCATED from PARTIAL (see patch 23). PARTIAL
    indicates a recoverable trace gap without disabling the perf event,
    requiring tools to reset the decoder explicitly.

    In contrast, TRUNCATED streams contain ASYNC packets for decoder
    synchronization, so reset decoder is not needed.
 
 2. The AUX sampling calls update buffer callback [1], any fatal faults
    will set TRUNCATED to disable hardware and waiting for userspace to
    re-enable.

Thanks,
Leo

[1] https://lore.kernel.org/linux-arm-kernel/20260915-arm_cs_support_aux_sample-v1-16-35cf6f297d20@arm.com/

