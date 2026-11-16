Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD65C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 17:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bSGcs5pK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QDRAy9Sj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qo+XNJi3+qAMT97TnlZtT0eegnezla+dXLwHmpOKv2w=; b=bSGcs5pKTZ3/UESHbWTJL17VC0
	LNeB9KeYzbzqgLBeijWTGM/CKWvX/So//pfKFFLozaQJ4DxWju2/3hdtMdlvXyms4iCJaylyIiaoe
	NDY2/7hRb0qOjG9D5TkMyZkJ7icbT6Q+Czmd2LMH9hMEevOwKqiNB6bJtwVVuCT5JHyPx3p/botuT
	E/x/EnquJ3BQsOUa6e4bv4zHm0GDfh918bHBuoxNtB52i35Zk9Qe0oox5dRpLlFH4Q59olYD8GtAn
	usArEVfWx00DbWTLr0eagke1VRRolRYE05aAwQWErrd17LFwcVPmztP4Pv1GLX50+sBUZHJvJdeFu
	IlCc4Oag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0NY-00000003OK8-1T8X;
	Mon, 16 Nov 2026 17:20:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0NP-00000003OIM-3RmG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 17:20:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4141B6296E;
	Mon, 16 Nov 2026 17:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2451F000C9;
	Mon, 16 Nov 2026 17:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794849619;
	bh=qo+XNJi3+qAMT97TnlZtT0eegnezla+dXLwHmpOKv2w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QDRAy9SjFh2jGKg+EHev99/5hoZVQikPXRgMoyNqsTyGo2dMmUyUdqzqvn/82ia2d
	 lGiup191uGYqRKv60FZobuw2GEvamHnW0aIJou9Gi3YYtlnAA8ykCXj5BH9HDnvmca
	 FZ7WUBYkpt2mNIU7kwloD86l72adJtDk9lCVTnPwAoY3RlWbKCFE6Ft0MsI4gHqJfn
	 Nw0dmfZ1eHn6IJQGZjV/p3ECgGZWUF4jYADpd7Y06Wm1q4ULD8yxQNRB5DJFRcIeYz
	 nqYCAzG6W4n8lS5MEwoOtzjLuZRnc2ozVgMS2xztuwFx+yoyHO4ATBGJTqvsYDfKgP
	 MSMEpQRNqx6Yw==
Subject: Re: [PATCH net-next v10 2/4] net: xdp: add xdp_buff_shrink_tail() helper
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, Jose.Abreu@synopsys.com, boon.leong.ong@intel.com,
 horms@kernel.org, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bpf@vger.kernel.org, nb@tipi-net.de
Date: Mon, 16 Nov 2026 17:20:16 +0000
Message-ID: <179484961693.3136.10654880889378798099@kernel.org>
In-Reply-To: <20261112-stmmac-rx-mb-v10-2-d3d04b65c6bc@oss.qualcomm.com>
References: <20261112-stmmac-rx-mb-v10-2-d3d04b65c6bc@oss.qualcomm.com>
X-sashiko-severity: Critical
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 2 · High: 0 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Critical] The patch removes the lower-bound check `data_end <
  xdp->data + ETH_HLEN` from the linear path of bpf_xdp_adjust_tail()…
- [Critical] The new exported xdp_buff_shrink_tail() (net/core/xdp.c)
  checks a linear shrink only against the lower bound: `data_end =…

--

net: xdp: add xdp_buff_shrink_tail() helper

This moves the XDP tail-shrink logic out of bpf_xdp_adjust_tail() and into
net/core/xdp.c. The frag shrink helpers move with it, and a new exported
xdp_buff_shrink_tail() handles both the linear and frags cases.
bpf_xdp_adjust_tail() now sends every negative offset to the new helper
so stmmac can share it for FCS stripping.

> diff --git a/net/core/filter.c b/net/core/filter.c
> index 9b8d5191c4ba2..5ea45dfce7a22 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -4438,96 +4438,21 @@ static int bpf_xdp_frags_increase_tail(struct xdp_buff *xdp, int offset)

[ ... ]

>  BPF_CALL_2(bpf_xdp_adjust_tail, struct xdp_buff *, xdp, int, offset)
>  {
>  	void *data_hard_end = xdp_data_hard_end(xdp); /* use xdp->frame_sz */
>  	void *data_end = xdp->data_end + offset;
>  
> -	if (unlikely(xdp_buff_has_frags(xdp))) { /* non-linear xdp buff */
> -		if (offset < 0)
> -			return bpf_xdp_frags_shrink_tail(xdp, -offset);
> +	if (offset < 0)
> +		return xdp_buff_shrink_tail(xdp, -offset);
>  
> +	if (unlikely(xdp_buff_has_frags(xdp))) /* non-linear xdp buff */
>  		return bpf_xdp_frags_increase_tail(xdp, offset);
> -	}
>  
>  	/* Notice that xdp_data_hard_end have reserved some tailroom */
>  	if (unlikely(data_end > data_hard_end))
>  		return -EINVAL;
>  
> -	if (unlikely(data_end < xdp->data + ETH_HLEN))
> -		return -EINVAL;
> -
>  	/* Clear memory area on grow, can contain uninit kernel memory */
>  	if (offset > 0)
>  		memset(xdp->data_end, 0, offset);

[Severity: Critical]
With the ETH_HLEN check gone from this path, what stops a grow on a
linear xdp_buff from wrapping the pointer?

The offset argument is ARG_ANYTHING, so a program can pass any positive
int. data_end is computed as xdp->data_end + offset. For the linear grow
case, the only check left is data_end > data_hard_end.

On a 32-bit kernel with the default 3G/1G split, packet buffers sit at
or above 0xC0000000. Take xdp->data_end = 0xC5000100 and
offset = 0x3B000000: data_end wraps to 0x100. That passes the
data_hard_end check, and then this runs:

    memset(xdp->data_end, 0, offset);

It would zero about 1 GiB of kernel memory past the packet buffer. After
that, xdp->data_end is set below xdp->data.

Before this patch, a wrapped value was always below xdp->data + ETH_HLEN,
so the removed check returned -EINVAL for it. That check now exists only
in xdp_buff_shrink_tail(), which runs only when offset < 0.

The return value also changes for short frames. A linear frame already
shorter than ETH_HLEN used to get -EINVAL from
bpf_xdp_adjust_tail(ctx, 0), or from a small grow that left it under 14
bytes. It now gets 0. That seems to contradict this sentence in the
commit message:

    Behavior for valid offsets is unchanged.

Should the lower-bound check stay in bpf_xdp_adjust_tail() for the
offset >= 0 linear path? The later patch "net: stmmac: rework stmmac_rx
to support XDP rx multi-buff" doesn't touch bpf_xdp_adjust_tail(), so
this still looks present at the end of the series.

[ ... ]

> diff --git a/net/core/xdp.c b/net/core/xdp.c
> index 470bf90d93ef2..7c98dbc2a770c 100644
> --- a/net/core/xdp.c
> +++ b/net/core/xdp.c
> @@ -672,6 +672,97 @@ struct sk_buff *__xdp_build_skb_from_buff(const struct xdp_buff *xdp)

[ ... ]

> +int xdp_buff_shrink_tail(struct xdp_buff *xdp, int offset)
> +{
> +	void *data_end = xdp->data_end - offset;
> +
> +	if (unlikely(offset < 0))
> +		return -EINVAL;
> +
> +	if (unlikely(xdp_buff_has_frags(xdp))) /* non-linear xdp buff */
> +		return xdp_frags_shrink_tail(xdp, offset);
> +
> +	if (unlikely(data_end < xdp->data + ETH_HLEN))
> +		return -EINVAL;
> +
> +	xdp->data_end = data_end;

[Severity: Critical]
Can xdp->data_end - offset wrap here and still pass the lower-bound
check?

bpf_xdp_adjust_tail() passes -offset, so a program can ask for a shrink
of up to INT_MAX bytes. The old inline code also checked
data_end > data_hard_end for shrink requests, and that rejected a
wrapped result. This path no longer has that upper-bound check.

Some 32-bit configurations put lowmem below 0x80000000. Examples are
ARM with VMSPLIT_1G (PAGE_OFFSET is 0x40000000), nommu ARM (PAGE_OFFSET
is PHYS_OFFSET), x86-32 with VMSPLIT_1G or VMSPLIT_2G_OPT, and m68k.

On those, a shrink larger than (u32)xdp->data_end wraps to an address
between data_end + 2^31 and 2^32. That is always above
xdp->data + ETH_HLEN, so the check passes and the wrapped pointer is
written to xdp->data_end.

The packet then appears to span gigabytes of kernel memory. Direct
packet access, bpf_xdp_load_bytes() and bpf_xdp_store_bytes(), XDP_TX,
redirect, and skb construction on XDP_PASS all trust data_end after
that.

Should offset be checked against the linear length before the pointer
subtraction? This code is also unchanged at the end of the series.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-stmmac-rx-mb-v10-0-d3d04b65c6bc%40oss.qualcomm.com

