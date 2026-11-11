Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E6D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a3KOelPG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HYJXTLlB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cr2pCTFrOAbsGZegayn216J45MBNzuazgQE21QPz1MI=; b=a3KOelPGfcvu7I
	AZBhK4Y20+gukva9BO2M4V8E2igc5wBiggU+FA8foMLmT6qoaoi3Ifj5thvjqn1CoG5k4CAHVDJ+w
	FYfGgnevSEwKiCDMqAtHpX4vSMS7sX47iY+P5r9LQtLbHkqDi+ROlHWtqmZ+f6wpqfjUO3BAx951X
	1OejROZabSbfzoD6FD9wEQ+2x3SytPMHslLFaDqnFRyr9Yk30gu7sGpp8Sz3ELMsexpnug8gq9RYW
	WasenG6oBHk3opkcNBH0G7fdKbTpRqI7FMrP+GIWd2Xhymi/DbLPnEH6yxxxIiMA7519R4m6uK5WG
	oYGdvbj8g3Try3enJ83Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBDw-00000007CPX-2PFR;
	Wed, 11 Nov 2026 16:31:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBDu-00000007CPP-3vR9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:30:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8997D609FB;
	Wed, 11 Nov 2026 16:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5771F00A05;
	Wed, 11 Nov 2026 16:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794414657;
	bh=cr2pCTFrOAbsGZegayn216J45MBNzuazgQE21QPz1MI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=HYJXTLlBkrjdCyCseNojn+GKtcau2ROmDR7O9+x7L30p+vfVl4Plq015VpJrchrOz
	 TaUDgnq1yVIkN0fenOZXBb0v2nbIAmNVcaM1+TPp5V2nruW3E0T05p6/jfAF8VdX75
	 uliVVhEvdmSO7Ct5e7QtzBG6cCxEg0z4hiyYhr9iGhZs3GyLzL4Fv/Y1oICE3+yhP1
	 KJTu7WcQTMSrW1AEmYqTOUnfZkCipZaOQTZ/Ro3IpmtuHLmUUwnBO9eZI2O5zLW1DC
	 cDHcLSgfzzZ2eLOd4aB8Sf+1asUGwFipYGTGv0fC5U4LVM5IZ0OUXNs7DEaYri/drU
	 Aoct9somAsisg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id C7BEE198003A;
	Wed, 11 Nov 2026 11:30:54 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 11 Nov 2026 11:30:54 -0500
X-ME-Sender: <xms:PZj0auo1yxfbFfoGoe9LA3bze4AUiD2An_4zxSrIHkbIvVodyyrEuA>
    <xme:PZj0ancEPS_EwtAiNfbY-ne7ERjRduKZhGB68FbV7HlKRVDmEAac0oJRa1RvcxAGp
    5wc0pd3JW79Vrb51bSSXqHjl1F7foU2cqSayY2YsT5CiLZuze7OvcFv>
X-ME-Proxy-Cause: dmFkZTFpCDf50Xoa/3FMvMuf7A8f3PJYtfoT7NfTRf1FAj4xrp/TZ7mdtLRTn68GfPgMJ9
    gOWIXB3Uu3n7NPR8X6I74B7dRDod70iDH45teUN8bx1XM5VxMSJmLSZFQWwB/4h1rF+uu1
    OpPogxxBHhgok4UwYvI6hS7XJDuoJTbFv0VO+3J3AU8dBeuZwO3HlN6YPFJsPeRJKhG728
    ivaHzkQsgcddsn3/A8eK42elF6/pmoqtOGVf1HoN8Hly4puxJMgJcY/bP1SnPDjMX7jp4u
    pPMni1/OW+9kwi1KQ3lpPgrBtDgBieGAuD1a2nmSSD2Kafmp2l2/wXFIgC1x9RL9+hjeqP
    TqfbvuCgAg4rHpNJaykQ25kK/tzd5ex/11q10soXw5OdC4B0zDjtUlNrX9BcBP6IomNI8y
    79ZDEbjtauyG5/0C4z1Isq+H4pazjcbIgz/IW1j+gDA3QUrZyGkr1yDLFj1OgVDpNb6UlI
    oMLUkCKwYPSqI5PyKEEBEklcN4GxrZVtenfesf9/NSj/ShHx/YIaN66TtpdTfp09uWCDfP
    yy3EBqX1Zc843NxrJeIOZ2urAklqXZsaWUMcxAqTV9v2B7+Xc66apNy9/yCCME/HqyJ2JU
    vm8mEuMZIlZEXSnACDFBg9sFgnmdddVynNhRneKlJbbuO0/gim5NiOG6kzqw
X-ME-Proxy: <xmx:Ppj0asPEuxi4mqou_qL5wWf4yPAcIYj2qjboqd3Wl9TEwYB3VS88rA>
    <xmx:Ppj0arIJ8HqijEeffIGZBY9W5HQ6MaBpJBGBDu94XxIQEcHIF2c2sg>
    <xmx:Ppj0au3OfNb3QKHzLSaJBZZKJSWUScF5xo8I0ROQ17XMZESgNkrSWw>
    <xmx:Ppj0avWOASA0RTI7q1GoI3tKSkhtJ_bIqkeuk2QHDyHPUhFJX2hGMQ>
    <xmx:Ppj0agNARD5wNSMvLawZnFjIaO77c3egnfyKyLWF5-zbaXsbGy-TG9ZZ>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 10F4932A0099; Wed, 11 Nov 2026 11:30:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AmbH9dKluAxR
Date: Wed, 11 Nov 2026 17:30:31 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Vladimir Murzin" <vladimir.murzin@arm.com>,
 "Changyul Lee" <lcy8047@gmail.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>
Cc: "Liviu Dudau" <liviu.dudau@arm.com>,
 "Sudeep Holla" <sudeep.holla@kernel.org>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <8a20b9a9-b10c-4b7f-8d42-2e8c60edd943@app.fastmail.com>
In-Reply-To: <89544da0-7c18-4fe5-8005-131760a2b8b5@arm.com>
References: <20261106010611.1708587-1-lcy8047@gmail.com>
 <89544da0-7c18-4fe5-8005-131760a2b8b5@arm.com>
Subject: Re: [PATCH] serial: mps2-uart: Remove the ports_idr entry when probe fails
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026, at 15:17, Vladimir Murzin wrote:
> On 11/6/26 01:06, Changyul Lee wrote:
>
> Before getting into the review, I'd like to clarify a few things:
>
> - This driver is only used on a NOMMU platform, where any code
>   can write to any memory location, so the security impact of
>   this issue is likely minimal
>
> - The only platform that uses this driver is deprecated and
>   scheduled for removal [1], with the driver to be removed
>   afterwards
>
> @Arnd, could you please advise on how to proceed? Should we
> review the patch, leave things as they are, or take a different
> approach?
>
> [1] 
> https://lore.kernel.org/linux-arm-kernel/20260908152808.3928630-12-arnd@kernel.org/

I don't think it's super important, either applying as-is
or ignoring seems fine, just don't spend too much time
on a review.

For some of the platforms I'm planning to remove it would
be nice to backport fixesto the LTS kernels in case there
are some users after all.

Chanyul, it looks like you've done a thorough job testing this
patch, and you probably have similar work for other drivers
coming. I would suggest you try to prioritize the drivers that
are likely to be in use somewhere.

I have a branch for removing a lot of drivers including this
one, maybe check your other patches to see which ones are
obsolete.

      Arnd

[1] https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=board-remove-7.4

