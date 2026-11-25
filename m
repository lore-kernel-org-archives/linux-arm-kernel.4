Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078C8606A6AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aM7sOQis;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=XsGzjmjo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NwvHgGTXJz0wJa/djlhMj0y+yVLq4gmsEHRyjatrEP0=; b=aM7sOQisoxZnMY
	GtE1F45pDauMos3Qy5fd3zw29tCA1avIefqgVDrSC/V9yXcb6NqzlIGxgK+9xPUWwbv/fB0Aqw3Dj
	XEE7XKB43W+9yc7xLxPq3oHLhc1tzE8rDrKhmFJb7zdCFSrS4ZtSAGDO5FWtpIsHoSRE26AcRERz3
	d4zt9zBL+Ro66tytBqvj/6X2s3Wg4BMNmu1LGtmPtvROoJ4xEw8qW+Oi3GuVyquOF4LQd8jxh+B7i
	GoFn5Q8z85l2SEBzrcl27456P58qdFd3iD0aKnnrZXGq+LpxPhhR1yAZyAt06QPMHA/WABjyJdXEI
	+crriLJtct1/l1bngLDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF3L-0000000ANTP-3BpY;
	Wed, 25 Nov 2026 15:36:59 +0000
Received: from smtprelay0016.hostedemail.com ([216.40.44.16] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF3B-0000000ANOd-44dF;
	Wed, 25 Nov 2026 15:36:55 +0000
Received: from omf15.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id C1B84A0F80;
	Wed, 25 Nov 2026 15:36:47 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id 3AABF18;
	Wed, 25 Nov 2026 15:36:45 +0000 (UTC)
Date: Wed, 25 Nov 2026 10:36:43 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Martin Kaiser
 <martin@kaiser.cx>, Vinod Koul <vkoul@kernel.org>,
 <stable@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 1/1] tracing: Fix UBSAN shift-out-of-bounds in
 test_event_printk()
Message-ID: <20261125103644.5bad3010@gandalf.local.home>
In-Reply-To: <20261125080431.1612026-1-kuyo.chang@mediatek.com>
References: <20261125080431.1612026-1-kuyo.chang@mediatek.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: m4pnd9zcch9bbufyr11t9hmbuaht3zhm
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 3AABF18
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1//DpdCkurl9IwChUg4S7PUZPcI6x6HW/A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=NwvHgGTXJz0wJa/djlhMj0y+yVLq4gmsEHRyjatrEP0=; b=XsGzjmjoMxoMNthM05a1soAIZVCxY2jFkSDWG+o3ya/P4N4bpCdnf6e2xkUKZKZoZPGTrkCKdDnzhzUkISwLnTSLMn1/0i1w9U+N0Zw7B0F1FAuJzvH/6sK4ChPR1233R9OiOV64cVIQM9yryrVUgPFATAn2J/cl24oHrxraCyU=
X-HE-Tag: 1795621005-232792
X-HE-Meta: U2FsdGVkX1+P7p3L822E/fIOJ09gdK0kUBB9BPSUyBuoVEeMsP2HEPTRIFkFOXDsyPzvuPHbPiQwZK8znmtz7AGHbj3uW1X8+1fg9qJ9H2DWcWGwN59oE9XrGTkxTkP35JrqzA2kx/7vnEcsSFF6uXXY4ojMxFUcETDUaXPsko9NmeF44Jv3mKDb+I4j+/Ditay3S7jnX4+GMX30/Pn9caNemdPW0s3p9IpyBrSgZULdpWGgHx0FobNv3zu0mYVJiE9k5xgG00DjJ3znejhdmh8TKyuF6C8ln7z34Tx5UW2VNoqTGoK7ilrhJF1ACMCn27j64DaE1ZZFVCOZm0MnluJaRxjiklQe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_073650_784998_D19DCE16 
X-CRM114-Status: GOOD (  15.71  )
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
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 25 Nov 2026 16:03:56 +0800
Kuyo Chang <kuyo.chang@mediatek.com> wrote:
>  kernel/trace/trace_events.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
> index 7f89160aeff3..5933fc92f786 100644
> --- a/kernel/trace/trace_events.c
> +++ b/kernel/trace/trace_events.c
> @@ -526,7 +526,7 @@ static void test_event_printk(struct trace_event_call *call)
>  				case 'a': case 'd': case 'D':
>  				case 'g': case 't': case 'C':
>  				case 'O': case 'f':
> -					if (WARN_ONCE(arg == 63,
> +					if (WARN_ONCE(arg >= 63,
>  						      "Too many args for event: %s",
>  						      trace_event_name(call)))
>  						return;
> @@ -556,7 +556,7 @@ static void test_event_printk(struct trace_event_call *call)
>  					if ((fmt[i + j] == 's')) {
>  						if (star)
>  							arg++;
> -						if (WARN_ONCE(arg == 63,
> +						if (WARN_ONCE(arg >= 63,
>  							      "Too many args for event: %s",
>  							      trace_event_name(call)))
>  							return;
> @@ -610,7 +610,7 @@ static void test_event_printk(struct trace_event_call *call)
>  
>  			test_double_dereference(fmt + start_arg, e - start_arg, call);
>  
> -			if (dereference_flags & (1ULL << arg)) {
> +			if (arg < 64 && (dereference_flags & (1ULL << arg))) {

The above should never happen. If anything, arg >= 64 should exit this
function immediately.

-- Steve


>  				handle_dereference_arg(fmt + start_arg, string_flags,
>  						       e - start_arg,
>  						       &dereference_flags, arg, call);
> @@ -625,7 +625,7 @@ static void test_event_printk(struct trace_event_call *call)
>  
>  	test_double_dereference(fmt + start_arg, i - start_arg, call);
>  
> -	if (dereference_flags & (1ULL << arg)) {
> +	if (arg < 64 && (dereference_flags & (1ULL << arg))) {
>  		handle_dereference_arg(fmt + start_arg, string_flags,
>  				       i - start_arg,
>  				       &dereference_flags, arg, call);


