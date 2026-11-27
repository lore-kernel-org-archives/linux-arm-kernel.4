Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428C0606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OAJHIOzh;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GBpnaCxs;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3LNuVTnC;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GBpnaCxs;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3LNuVTnC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ybmf5eA8nO2z1EXCBSwNgRRAB14C9dISogEzuEi/y2w=; b=OAJHIOzhqecxlQP3sDPkqNIq6J
	ZtgkKAxGvzNseU/kMJ1K6IzO0d169dRy7HiZg+HZkFGZoPkU5DKct6PpcTn1nJqMkdvKx8dze98X+
	wCzV8wDgJ5gdEdUAzP20lwwlTwyzK1wggwcszCD+JEezrd/HOFM7ztLETYLSVUBk2dMxWoIcfq06P
	0BxRaaB1lY1LNgd5qFrjH1UskW09V3dXDzGIByNAGB3YP4WqQUaC5dv4NMe8tBRnki2skXt6SCfJL
	fZl8zmS+HpF7UnqZI5wdyWmBjKPS0S8GzNgYjU/Xm6By2/u4BgCaXaUKLiUc6We6U1t/Flg5gINeA
	tQv/spUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzt7-0000000HIRG-0Npb;
	Fri, 27 Nov 2026 17:37:33 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzt1-0000000HIPo-3wxq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 17:37:30 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 692BA229B3;
	Fri, 27 Nov 2026 17:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795801044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ybmf5eA8nO2z1EXCBSwNgRRAB14C9dISogEzuEi/y2w=;
	b=GBpnaCxsoKsqmpgeuhX6PcK38zGVRL1/v00yZkO5RzTAeEU+QO4frT7xyJIA1y4rPYgIsX
	lV5sXHrpp49aL1Pa4OByttGbsLLMu2kBGfQS05zYuO4lJ1QKetFYD8Vh8lb7IP0sh7aF03
	Ye4jiVGzCrWv7jEbRJIBebq4mT3+uv4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795801044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ybmf5eA8nO2z1EXCBSwNgRRAB14C9dISogEzuEi/y2w=;
	b=3LNuVTnCHbjBqdEeosKTgmGqj3A/cj+ua712lvZFZrPhyOdszGUDIWOjjaHLfZngDZhZbX
	x988wy/bUCrp7IAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GBpnaCxs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3LNuVTnC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795801044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ybmf5eA8nO2z1EXCBSwNgRRAB14C9dISogEzuEi/y2w=;
	b=GBpnaCxsoKsqmpgeuhX6PcK38zGVRL1/v00yZkO5RzTAeEU+QO4frT7xyJIA1y4rPYgIsX
	lV5sXHrpp49aL1Pa4OByttGbsLLMu2kBGfQS05zYuO4lJ1QKetFYD8Vh8lb7IP0sh7aF03
	Ye4jiVGzCrWv7jEbRJIBebq4mT3+uv4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795801044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ybmf5eA8nO2z1EXCBSwNgRRAB14C9dISogEzuEi/y2w=;
	b=3LNuVTnCHbjBqdEeosKTgmGqj3A/cj+ua712lvZFZrPhyOdszGUDIWOjjaHLfZngDZhZbX
	x988wy/bUCrp7IAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B838134E8;
	Fri, 27 Nov 2026 17:37:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AW3mNNO/CWsIFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Nov 2026 17:37:24 +0000
Date: Fri, 27 Nov 2026 18:37:23 +0100
Message-ID: <878q2emazw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	perex@perex.cz,
	tiwai@suse.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: atmel: ac97c: fix reset GPIO error handling
In-Reply-To: <20261127100645.3564-1-sreekuttan2156239@gmail.com>
References: <20261127095029.3280-1-sreekuttan2156239@gmail.com>
	<20261127100645.3564-1-sreekuttan2156239@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 692BA229B3
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.51
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_093728_976314_265E3CB5 
X-CRM114-Status: GOOD (  13.95  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 27 Nov 2026 11:06:45 +0100,
Sreeraj S Kurup wrote:
> 
> The driver currently ignores errors returned by
> devm_gpiod_get_index() and continues probing. This can cause problems
> when the GPIO provider is not ready and the function returns
> -EPROBE_DEFER.
> 
> Use devm_gpiod_get_index_optional() to handle the reset GPIO as
> optional. If the GPIO is not available, the driver can continue using
> the internal reset mechanism. If GPIO acquisition fails for another
> reason, return the error using dev_err_probe().
> 
> Also, check the GPIO descriptor for NULL in atmel_ac97c_reset(),
> because the optional GPIO API returns NULL when no GPIO is assigned.
> 
> Fixes: 5f10e84934e4 ("ALSA: atmel: convert AC97c driver to GPIO descriptor API")
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

Applied to for-next branch.  Thanks.


Takashi

