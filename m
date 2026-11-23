Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B4F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1WUpNk9U;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fhe16LJb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GspHiISsMAJGMf3UxXzlbBZfXcuYxjQHDRAjesilWu4=; b=1WUpNk9UoSZ9d2YljaFkzirHVm
	VPUa5vszwnnbzZukXtBFYexHmbXZfpJhfOGRJ0AFXfXeP80Q8thfKw/ghkuhsbwxjI1Y2fth8iOiB
	O63DVvNOzWGuC8Vsif6yrnO8Xo+D7CtPt5D+Ia/b8yn+QcCWulRWBwG3ev+KBN/JHcwfl83QXZZbg
	JydMm/xG1TsDawljrJqn7d1O8vpHXaMXVAr0UJDv3PqEQBdu7ZwkX0RbgwyhrDBKvqpzIYjP+9eG/
	k5CSe8SXcR7OzHp/X2eOvvkUqXrhfr1uiDCoZMkS6RvpAJXVJDz8oKaEwORt/PYrt5xE4nyj6h5/g
	zQ9shlmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRFT-00000002wKm-3zSH;
	Mon, 23 Nov 2026 10:26:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRFT-00000002wKR-0s1w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:26:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 48C3461FAC;
	Mon, 23 Nov 2026 10:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496B71F000E6;
	Mon, 23 Nov 2026 10:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795429569;
	bh=GspHiISsMAJGMf3UxXzlbBZfXcuYxjQHDRAjesilWu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fhe16LJbqMv4h0EgzpTJNPVpQXaFwFrx0yzWMfj/jW6j7JpWRk7ZDGrO77/YbSj40
	 CgXtUZfv8+vXCSjLOYrbDGjTkXWBx99hSz0sxS48QjmlFwGBbR22yj3rQIUQaL/vRv
	 yi3NJ2f7SQj0f+PMeS8P3pQaW7aYDKmdykoLLXb9FMmaOS66tFG6BIwgFdwNhTwmZl
	 imJXhRplH3PJVPjM8WmNwC9T7r1YbWlSvV9lV7EFIlL8eVLJ8VgaRSa6yKenPurl8i
	 MS9xlGI1Wf23urMxv4aBRm7PW2WegvAAolhDbxW1ZzS6GdEuCf4ZM4RtZe0Wy9KjpB
	 KXvtOyecECg+w==
Date: Mon, 23 Nov 2026 10:26:05 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Dale Whinham <daleyo@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Dhruva Gole <d-gole@ti.com>, Haipeng Lin <jimmie.lin@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Charlie Garner <charlie@akao.au>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Don't mark OPPs as turbo without a
 sustained frequency
Message-ID: <20261123-eccentric-ludicrous-roadrunner-0a7efe@sudeepholla>
References: <20261121-sp11-noturbo-v1-1-37e1083cec5b@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121-sp11-noturbo-v1-1-37e1083cec5b@gmail.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 21, 2026 at 12:56:02AM +0000, Dale Whinham wrote:
> If the firmware reports a sustained frequency of 0, every OPP is marked
> as turbo. With boost disabled, cpufreq then has no usable frequencies and
> fails to create a policy for the domain.
> 
> The Surface Pro 11 (X1P64100) CPUCP firmware does this for the two
> clusters that have a core fused off.
> 
> Treat 0 as "not provided" and don't mark any OPPs as turbo.
> 

Charlie had posted a fix for this a while ago but never got back to my
comments.[1]

> Fixes: a897575e79d7 ("firmware: arm_scmi: Add support for marking certain frequencies as turbo")
> Cc: stable@vger.kernel.org
> Tested-by: Haipeng Lin <jimmie.lin@gmail.com>
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> ---
> From decompiling the CPUCP firmware: it reports as sustained the first
> LUT entry rated for exactly the cluster's fused core count, or 0 if
> there is none. On X1P64100, clusters 1 and 2 have 3 cores but only
> 4-core LUT entries, so they get 0. X1E80100 reports non-zero values and
> is unaffected.
> ---
>  drivers/firmware/arm_scmi/perf.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
> index 0116ffb2b279..d4394984a0f5 100644
> --- a/drivers/firmware/arm_scmi/perf.c
> +++ b/drivers/firmware/arm_scmi/perf.c
> @@ -879,8 +879,13 @@ static int scmi_dvfs_device_opps_add(const struct scmi_protocol_handle *ph,
>  		else
>  			freq = dom->opp[idx].indicative_freq * dom->mult_factor;
>  
> -		/* All OPPs above the sustained frequency are treated as turbo */
> -		data.turbo = freq > dom->sustained_freq_khz * 1000UL;
> +		/*
> +		 * All OPPs above the sustained frequency are treated as turbo.
> +		 * A sustained frequency of 0 means the firmware didn't provide
> +		 * one, so don't mark anything as turbo in that case.
> +		 */
> +		data.turbo = dom->sustained_freq_khz &&
> +			     freq > dom->sustained_freq_khz * 1000UL;

I worked out something very similar as a solution. Anyways does it work
if we also add the check for non-zero dom->sustained_perf_level ?

No need to repost if you agree, I will fix it up while applying ?

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/arm-scmi/20260923152245.44624-1-charlie@akao.au

