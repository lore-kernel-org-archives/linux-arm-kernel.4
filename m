Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E041B606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 07:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XyZ996KL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EtMwdRvg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NOjguDHiGpliPje8lgUyj591MMGA2gJ6nq9lkIN3/BM=; b=XyZ996KLOLYFJsUlLqmTtf32eF
	3v9cQPQ1TKWY6sOXxiUMOzAMbWkVXVxlgOY1h1dR0S5N5TYKvGR11S6yevKBvdx/j/E68S96UDai5
	ROWjhrd0yf0kiF7dmGDSdbpBdAMRpUO+6Gdw9traHFZxWKOuceJOmEysxbHWhs89bDKcqXO3752jG
	07jCzvHEcKevXvgB9Xi0j9fNT77RIrCyFBZP4Au5/cr5PDJVKwbrIkVtNnr/gHfAIryxoXmdnVClg
	l80odnz9aJj33fgKXWJ3TyMTXMktO4ze4exThxWuHxLTk4pcXFfQF8Cp7Ouf3BcPDgRjMqwlNpa4Y
	F112BWOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIyD-0000000EEBO-2aoq;
	Fri, 20 Nov 2026 07:23:42 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIy6-0000000EE81-2oPD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 07:23:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48e47347279so290614f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 23:23:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795159413; cv=none;
        d=google.com; s=arc-20260327;
        b=RPvP0MCwYoglOSSiFxQ7uPj6lac21dFwI5hko98vz/OAG7j22GQgtVm6RK7qbB/7uz
         uPdwRWoWcpWD8IsMLC4dj+YT7aG4cDoXr3+toYIOa2e6m/6WT1ut70YWkYngJdSOj/C2
         AD9yfm+RwqFNVMhP31nT5Y4Ygqm470hJR/1NbG1gOOfj7bVhR8nQ4PHOBq46KloD9V5+
         DZB+sTLdDuHpOfTjiSgYQP8guC518CGG+aWkANO5UPBmyF2bu6D3SZxreaRNIa0YCCHc
         9oFqCT1SgO3Yk9jRNIOJFOzAxFc/bEMS5b3bOJTJugCZkHby3OAMz4Tw47uj1yVSKmcG
         1hnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NOjguDHiGpliPje8lgUyj591MMGA2gJ6nq9lkIN3/BM=;
        fh=7m7wdlDVZiFga/KBjzpgOwMF+7JICjfbqI8AWT0ABLw=;
        b=s/WgwJ393kSXEOf5pGpOr2SEwY1Nl6NmSZgsuBcw7Fcatw4uZ8AT1mWfmKGIkR59AN
         PPfxQ4li6pl1PO02XxY1Tpg2RqeGAklsWcDixTj+ShOptI8gckYqCstu3LWTt/OPMyQF
         g5fmNRZUD68k8AC2DQzjUs6m3oBssVWdQYfQhzwoPhFxq05ssIkmEUAnEqo54/iC8G0h
         VXpSnagpBzRmvf0II4cUEK4GpYnstFBSDkM4LH/bV03enSwwBFl5/ROBsjKrw+IBvv5t
         dOBii4oB5vL8vax8N4K6Lt1+lEyeOtiRiApRMfNn8MarVk2IN6njUKdocLBezw9LCqpr
         80mw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795159413; x=1795764213; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NOjguDHiGpliPje8lgUyj591MMGA2gJ6nq9lkIN3/BM=;
        b=EtMwdRvgxfGYdwt2gI60fbTye8q/TyuL/FiVGUW5ET+UEFgBi0v+nqZHM4YiImlqVz
         Q/ID+dcGdSHx+KbXChcpJhZe1yyUOL+KSZcCsLLHJrBkwCKAzeMMx58NHoXLK0afO8yw
         kVYVLUP/Kgl6aBeZcozNk+evxNDuFlFdv8EuEFpkN1beH468g7aLgVDEHxQZ8wY091Xj
         oMeKy3CZfh5ac2oY/KVDEIVFRQOYZZ7bkt95s0Lzt6dYpuMRVWg0kJEdFU0u4j74TTTZ
         Kbri1OXgnIA6EVBYYHxJMSBbFU27QG7fY5gDL/Jzp3J82hRJ14EXl0PgjDbN1R1CmX2r
         j3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795159413; x=1795764213;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NOjguDHiGpliPje8lgUyj591MMGA2gJ6nq9lkIN3/BM=;
        b=hUVGmuiLyoYS6n1zy1KTIe8ywc4wVpc5G9PBphtlkEpJjn68BRKFOZQjRI5NACNjRO
         nFmMKyQxzNjLmhHBcTjNoYi5M3mBNDNoxvANFPr4V2o28Rv9YyXffMN4MjPHy+cYZy0C
         piTl/D7VhY72NVYtyHHPGooUwO0vOi8MtDDNKLXmrxDknpN+xbSxSOSggPvrU1lvkdP8
         bZGBs2DVh1WXbhZ9urj2KwNx9DSosfkGWUJsPjTOA7V6GZlaqXb99Mt2klyMC2fnvXz+
         GngIV+Bl/jgEdYygDl3RbfN0EYKpg4oMC9pYJghzZPsiIMItOIiUwdJh8m13EL6umOER
         E0bw==
X-Forwarded-Encrypted: i=1; AL+hErEy2otc22M4hoEc1C+g0d+Z/i1gG43RywmmDSIqPNf++IFLE95IYjze+mt037fjX0u7q48pM05DDCAb6g/50lSt@lists.infradead.org
X-Gm-Message-State: APuU4Z/l4FHD4uZ6VntiNQlMbRpL6Xe9bp1V0aHoZQ6DdBQfzhNT7OYn
	xkHKiP1GXVm6Tjat4zVwtOg7iBq6arFRAIbJ2rWfrDF0LXHjKdF543DdLh3rMwqYuENttX+hmaN
	XoGnKo+46peHJcIT3WGHOJR0uTlmcyO8euqwf
X-Gm-Gg: AZFdTZfbI3ujOmNVNngh2/TQiBl38fZ4RWWpLkB90dHOWsC3eYDN/8qh+GenozL9wPr
	a4lJGy2M7k55njnEbeyUqd4w2ZBXH9F+ORlf2gpTrsfyiDzxBVwLT6lpR9wjo06gJJQWA8pxZjP
	EiPQ9en0k/kqA9k2Dk5LvHpjjn5rLuEZpLoeXvtzYL9Wf5/AX3HfngOjhtMMLBljDNwrCRI5qCu
	RXN55wd1hgxo0O6hCEYRENwt3t/iJ436engHiBDKoIsxjNn/qQV/ssT6hdK7u4gMvBS8Zpr0F6p
	6v0ffNbO4bfX6ixx/7sh0OOyqEiYJFJd9YBTdEsnKFdGgVFIikxmHJMmylvGJRuqTwKLiHm6ET4
	BTK3hkkjG+7KgZLJMZP39LMelUHK2ZmH8a/Ps+uxSu7PGLkMsY4JT9ugnyw==
X-Received: by 2002:a5d:5888:0:b0:490:a481:7ac8 with SMTP id
 ffacd0b85a97d-4abb532ea79mr3553673f8f.29.1795159412630; Thu, 19 Nov 2026
 23:23:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119124928.1398520-1-maoyixie.tju@gmail.com> <av8osemFMD6C2EdK@lore-qca>
In-Reply-To: <av8osemFMD6C2EdK@lore-qca>
From: Maoyi Xie <maoyixie.tju@gmail.com>
Date: Fri, 20 Nov 2026 15:23:21 +0800
X-Gm-Features: Aa3M54qvLIAoTLXhSwpuxxRmvv68nNUsPxUUak29GDrjI45vtYhuyOcNNPOYrRw
Message-ID: <CAHPEe=FFgzM3L9aiBNczg2AQ4JiG-p+eFKLemjrOMzekuBmHpg@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: sdio: check the RX packet length in mt76s_rx_run_queue()
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-wireless@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_232335_352932_94752AD5 
X-CRM114-Status: GOOD (  14.26  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lorenzo,

On Thu, Nov 19, 2026 at 05:49:53PM +0100, Lorenzo Bianconi wrote:
> I do not think this patch is correct since we actually consume just len -
> MT_SKB_HEAD_LEN bytes at most, right? I guess we should add something similar
> to the patch below, what do you think?

Thanks for looking at this.

The fragment is len - MT_SKB_HEAD_LEN bytes, yes. But
mt76s_build_rx_skb() first copies up to MT_SKB_HEAD_LEN bytes from buf
into the skb head, so a frame still needs all len bytes between buf and
end.

> +     if (data_len > len && data_len - len > buf_len)
> +             return NULL;

The caller passes buf_len = round_up(data_len + 4, 4), so this check
never triggers. With it applied, my harness still reports the same
reads past the buffer.

Also, rx_check() runs before mt76s_build_rx_skb(). For a TXS frame,
mt7921_rx_check() and mt7615_rx_check() walk the records up to
rxd + len / 4, which a check in mt76s_build_rx_skb() cannot cover.

So I think we should keep the check before rx_check(), as in this
patch. Frames that fit are not affected, and the loop already ends at
a frame that does not fit.

Thanks,
Maoyi

