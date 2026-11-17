Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFF0606A88C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vDlmaCS3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZkuDPoOL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Svf8mXjdvaTbcsFxZ1sCO/PZR8yJDMX2INAsvYj8fC4=; b=vDlmaCS3FxYEO0/1t7AxSgGf+Q
	JS5B8C36VHCkbGBn2KKtvQ4JPc4mxhj10hPEHoizCSZ0W3D6suuCW9SSDOhd6sVHPlWmA+UGIT69n
	qUSN8JPB+HnXcpdWVGe0cFZc3SxyzpwpYArv65+Sb3Z6yTJkBsIw2On3J8PCYnURVucGI6dVQYv8p
	Dn7Db4hcBDXahUDcFu+aRxClVcdAA2cCl5WXTw2NjJ7xm6cJDeJlDHneyXWCXxAVwd/l64LPzGZES
	Bz/wriYAN2qYN90I6LNgEj5FdsL1do+Hluv206+QAvboo9th5TtbGxjxOpOnq2tvfOT5WlGSnQhKh
	gRvEFhGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJsl-000000064OQ-1Csy;
	Tue, 17 Nov 2026 14:09:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJsk-000000064OF-1hWq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:09:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B109A61828;
	Tue, 17 Nov 2026 14:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1F31F000C4;
	Tue, 17 Nov 2026 14:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924597;
	bh=Svf8mXjdvaTbcsFxZ1sCO/PZR8yJDMX2INAsvYj8fC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZkuDPoOLcq8p2QbdnBRvjir78h5VvT4GP3WXld91sQp9jbw2cmyDBxzgwkAyJ1JUN
	 l+at6JHsDk8JlzRaFBcViAyZKE94a//WshI35+7tB+d2+mfHp23o/S8NtQMY6dAvRl
	 YpoKlWJd545KA7bbcWFG6BEpwxos+tPieOlmJKlh3EPaGLtBM9DumDithn4mdmkh6Y
	 nMsRHupOWMDkrUQ9tHXG9G9aka7Ew1JdpB8dfx1Xijgb9GwWEj5NVdi9H5wFRtNAic
	 r7hNaCd5gcRDRuq8tONh1EbvDE2LsQ/v0RGTdOaTJDCXtJAEEMJ6em2lO5tUkYK1lE
	 zFiDyUtdUo8WQ==
Date: Tue, 17 Nov 2026 14:09:54 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, philip.radford@arm.com,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: Fix SCMI Power Control driver
 removal
Message-ID: <20261117-flat-nonchalant-dragon-a2dcb8@sudeepholla>
References: <20261116084211.3066460-1-cristian.marussi@arm.com>
 <20261116084211.3066460-3-cristian.marussi@arm.com>
 <20261116-merry-hypersonic-skink-91109c@sudeepholla>
 <avw8CvBXXWNx4YGX@pluto>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avw8CvBXXWNx4YGX@pluto>
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

On Tue, Nov 17, 2026 at 11:35:38AM +0000, Cristian Marussi wrote:
> On Mon, Nov 16, 2026 at 06:14:50PM +0000, Sudeep Holla wrote:
> > On Mon, Nov 16, 2026 at 08:42:11AM +0000, Cristian Marussi wrote:

[...]

> > 
> > Just wondering if it is better to stop receiving notifications from firmware
> > first and then cancel any pending work ? Basically reverse order of probe
> > for remove.
> > 
> 
> I think the order is irrelevant given the dead_srcu gating, BUT indeed I
> kept this order so as to keep the undo in reverse order: in fact the
> probe at first issues some INIT_WORK, but the real schedule_work happens
> only later after a notif is received, so the order is:
> 
>  - init_srcu
>  - static WORK init
>  - register SCMI notif callback
>  - RX notify msg
>  - register reboot notifier
>  - schedule delayed work
> 
> Also, even if the notifiers are inhibited by dead_srcu, I felt better to
> cancel that work as soon as possible.
> 
> Thoughts ?
> 

All valid points, with that I am OK to leave it as is. I was mainly thinking
of avoiding any further notifications when the device is being removed. So
doing that as early as possible would avoid handling of any late notifications
from the SCMI firmware.

-- 
Regards,
Sudeep

