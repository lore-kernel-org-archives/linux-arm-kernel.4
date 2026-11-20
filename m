Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917A8606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 07:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HsZOMKMQ;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=B2jZV994
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XheRX6sx6r1KaJuHijkiDv8O1r5kPpBBGPltrX4uTCI=; b=HsZOMKMQTXRKe7M7dQPoO9F43Q
	IZBK1uZ15QJcMQsdyOKLZl80qbQTYFC4flEIL3AQNA9MUaPd9WO7d4DqHEadDS+A2Mlqp7Zea4lPa
	bPSvdZb2p6spIidlOho1bxHIV3M8+55SfumpxDlbOsNlMNcFB/V87xQZvKTHAR6zKqlpW9B8RngsV
	nzT9LqFOGlpa0V/wxkVZXxp8xsUTKt3V/z74S+2ysbFkJqCRn0z4EUMpIuJDAgO0DZnXTPxHXfH05
	K/g5z3e9eVu/k12DmQ3mGRolER+r9FjzlaAN+lHdJELcEtN2O+Pkv0sbsC1lI9IADF5GfbLM1NvkT
	v0RUYaag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIwW-0000000EDZd-39p8;
	Fri, 20 Nov 2026 07:21:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIwU-0000000EDZH-3erZ;
	Fri, 20 Nov 2026 07:21:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC79C6240F;
	Fri, 20 Nov 2026 07:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1841F000C4;
	Fri, 20 Nov 2026 07:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795159313;
	bh=XheRX6sx6r1KaJuHijkiDv8O1r5kPpBBGPltrX4uTCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B2jZV994l15/UJMTDLl2P6x5JbABJhG9PC7So5dnd4diC5x+g+uWzkHPAKU8jFIsh
	 TAWyy/qozNXP1tYSQTb+3/qiRoNlcMe305sC9rJfrhYf7OQIVvTmJK6d1wUoxtZi7J
	 oj5e+CqvU569VwhTRHwwuZJRRlk6VDVWtqIC2JHU=
Date: Fri, 20 Nov 2026 08:21:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: yusuke8h@gmail.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: bcm2835-audio: remove unused
 bcm2835_audio_retrieve_buffers() declaration
Message-ID: <2026112041-suffrage-bonanza-e079@gregkh>
References: <20261112-bcm2835-audio-unused-decl-v1-1-3b63a24b033b@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-bcm2835-audio-unused-decl-v1-1-3b63a24b033b@gmail.com>
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

On Thu, Nov 12, 2026 at 04:29:55AM +0000, Yusuke Hayashi via B4 Relay wrote:
> From: Yusuke Hayashi <yusuke8h@gmail.com>
> 
> bcm2835_audio_retrieve_buffers() is declared in bcm2835.h, but its
> definition and sole caller were removed in commit d7ca3a71545b
> ("staging: bcm2835-audio: Operate non-atomic PCM ops").
> 
> Remove the orphaned function declaration.
> 
> Signed-off-by: Yusuke Hayashi <yusuke8h@gmail.com>
> ---
> Found while scanning staging headers for declarations without definitions
> with an AI coding assistant, verified against commit d7ca3a71545b, and
> compile-tested with Clang 18 (LLVM=1 W=1 C=2) and GCC 13 (W=1 C=2) with
> CONFIG_SND_BCM2835=m.
> ---
>  drivers/staging/vc04_services/bcm2835-audio/bcm2835.h | 1 -
>  1 file changed, 1 deletion(-)

Please read: https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh

