Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BAB606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 07:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AXaSEso5;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=FUI09/nk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=n6uuG2uPB07i0EMDMp6389WOiI/04+FhVXHCP2g9r7o=; b=AXaSEso5tRobmdp5PVWr5PoqTP
	J+aMcIpJMeLTDTdkY9p/0J6gFOQgzZ1v5jHE7gPQCFc0Da032O/MNrTvWeVpj7XOXqnShHn1HY09k
	u8hf7KcGkGmJVGUTugFvlKkPihPKmUtJ01vh/OUO62oN/Dwit3JgVsqNtk6Tq3QlSfMru3B3uwQ1h
	twt6F3BS2xP6AR1M8f2VSGH34Jn3S4gtHr2r/uNdKIqM6oy8mpoxeKFs9X+MH24DomflqCeE0DXIs
	a16aivpugJteNz41ZkJYNEYq/jFIxZFKNvHDAF0aO9VcvoW7jiMAH4lmNGhZxp4AtcLcjHKegEaKI
	zo9xT6rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJPS-0000000HXgF-0H5p;
	Mon, 09 Nov 2026 07:03:18 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJPO-0000000HXfr-2p6R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 07:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=n6uu
	G2uPB07i0EMDMp6389WOiI/04+FhVXHCP2g9r7o=; b=FUI09/nkUWlAuWPONUzm
	PBpyFxvz/uvZaoBZMiRROWtgh4kAXo/iNQpNNBHmnyoC5VOoayHkypsy9YXg8p5R
	doZHakc+1UkQUcclrwYqT4Dw7uLw1AKy/Ol4DoPqIin7IBrDx8K78ga4JkQQDJ5j
	4WpS/zSLvQD58t/WiZgnEfwnzhciwGhgfuoLUzum5a3pyYKNu16F6EgCxc12OR4M
	oO1zfTqPBzFPXG8DgNMdNwNJq2WJA/J4Obkxc2oIryygANbp8/ngx9cdlmg+B7Sj
	baY6vQ3riQZuriQDZcCMmzCODNaqzY/Dny0LEAXeuL/ZlHyB1/pnABJfMLWL5QNd
	qQ==
Received: (qmail 3132570 invoked from network); 9 Nov 2026 08:03:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Nov 2026 08:03:09 +0100
X-UD-Smtp-Session: l3s3148p1@qpDxjdJfkNoujntg
Date: Mon, 9 Nov 2026 08:03:09 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Linus Walleij <linusw@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	srinidhi kasagar <srinidhi.kasagar@stericsson.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Andrea Gallo <andrea.gallo@stericsson.com>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] i2c: nomadik: handle pm_runtime errors
Message-ID: <avFwLctRcnJHtINQ@ninjato>
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
 <20261103-i2c-nomadik-fixes-v1-6-655c6af2cb70@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-i2c-nomadik-fixes-v1-6-655c6af2cb70@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_230315_611210_614B6834 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> -	pm_runtime_get_sync(&priv->adev->dev);
> +	i = pm_runtime_get_sync(&priv->adev->dev);
> +	if (i)
> +		return i;

Testbots revealed a smatch warning:

drivers/i2c/busses/i2c-nomadik.c:737 nmk_i2c_xfer() warn: pm_runtime_get_sync() also returns 1 on success

I will fix it here.


