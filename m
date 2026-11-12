Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFD2606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 07:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IHIO/b2l;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=ZaECq2+H;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WT09LNp3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jtpWNo7TMacpo5dLQCzhDaqmAx7GU105iZnfQunsf+w=; b=IHIO/b2luDD+f7
	jcHwMtm51KzID4Nqc3IO7doDFsZUAs7Vmo2jAiD2lWYkpxnxM7rRAaXq6IKuXZZ0q+BONV3cP5SsK
	5l2HTercwvpqK6rMBuVE7P5OSldKO7dN8+7mP2d29Imn0JKBWXTW4d7UmjuHq1oJFvEAq52YljBTN
	hRNIXiyOXj0CudhagHLUG9SfsGm+ajqH5Bgy4gjrmy6OMjL/+4P8SSoE9pFrdgkbu5I2ta1XizfB3
	R6p7qPwnqHCwpRB6Xb3eD9521hJz/jpwRF4QSRIrRlW8zyVsZKp/bACM310OeHVHhryphjY+yFkQ2
	qwJPfxPYLSFhLGmc7SiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPEk-00000008vjX-3UAU;
	Thu, 12 Nov 2026 07:28:49 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPEh-00000008vfw-1J6B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 07:28:45 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id B5F971D0024C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 02:28:38 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 02:28:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794468512;
	 x=1794554912; bh=jtpWNo7TMacpo5dLQCzhDaqmAx7GU105iZnfQunsf+w=; b=
	ZaECq2+H3fZLSbZItu52liYGqOetSj4pzsfYVmCp+sFMJyF30SsjGOyB3UweUFrW
	G3K3H0C+yj6GxWQC+INukPp8kql8nLhkTumtAvdnXnVu7tAweKvytl9bgx/MOYcq
	ZXI7+Mq+mrbou63Jg+GQoTFvMy82or+7hxeDkOr8kPVR9Wx/O7/TzpLyc92BVPLJ
	fHJfF5GImdIqdXhbgGXYjx2TIOON0IEcgpXH34c6/Dw3ps/fHz7WTaI5Vb9z5aUA
	//Y16AQkhwl187DXYldkLbOb67eBvPMaqj4WoI/S5ueagvjVEuYgQmpxF+BSJ7GE
	Gaa6y/+QEd6es95GE1AMiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794468512; x=
	1794554912; bh=jtpWNo7TMacpo5dLQCzhDaqmAx7GU105iZnfQunsf+w=; b=W
	T09LNp3F+6ZU0cg7gjIeXUGQuCqupgHFyIfmNpPh66aUx8GzE/zkgrQWNZnMnx8o
	XgJ0F1/oU8sZzAZFgeGqAzD+QiWB6Kfhadoo0yq4X/W+eqAT+/6wXm+FOZxtGFj2
	74/BhZq8Te6hytXtqNimYxbi6+/nK8fSFXuS8nc7nz2/RtsfXPFm8cxjizbW8cg8
	tXDAAFkmook+dNokF2IHxHvlMlT/IBwH5RaM8voyo1K9kOTPgk2s8O0sLXAHDVTZ
	RA+wP3EV0T2HPhMd/C2del2gh8WvLwcE/Q7SefSQCiu7g61izsL6ItScQr7dun8g
	AryJ7TMpDRtXQf80DENVA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794468512; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:jHVnKJQQbzP3OQvUwS0byJwYBL7IAPiRz3rDgWhat3pYtGi
	vsKIxPEXUdR0RgZ5L+ZPRt4rQLZz7qn+H7b0N0FwhDpXyiwTYLu06XSpOwI7GmFk
	8IL+p0+8AD+EQFP2uzZexHu1gXmLWwksdXrBy4ULvRnLCQoCLxFJl7wiBUxR7O29
	TcqkR/HTCrYAl4G7ePsjeOtdH6anD0xRCAb0GGQRzCwRlshmjgEnCyqY/Css7/74
	yfNZpB5ZEDhYiLsObGRWEBWBbYZJQMbYvzA40FCSmxvUF53JmjV3I8Tb7SGyoSKK
	GEDhpG5/XXbQbSfCAuIbkW0FiwCSP6EacP9Tn4Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:nkTOjxKk9a9RAr7YpxephbkNfsVtf2NTfupsq0l/ugw=:jtpWNo7TMacpo5dLQCzhDaqmAx7GU105iZnfQunsf+w=;
X-ME-Sender: <xms:mmr1ajgXo3Axsmou4B7KzkByWU-AjBViiPTB4XgAgf2XF5doPwnv7g>
    <xme:mmr1aq0GfE83JG6NZFgZ58z-bruQmVZxeY_ZBDuEUj6-I1pJFr17kpOGFOwybGY_Y
    5taeQtgs4Qy4WFi7M-2EES5h-jy1WTMD1KzIm0hhukvwm10erYE9bV2xg>
X-ME-Proxy-Cause: dmFkZTF9Cii5tCJ/eiFoFWruahOT1qK5ASAcalVOMwjDWcFD/dMBUFqfeKLpzlac2VvZ8W
    V9iu/o6ZR+Sv+050sngjcdznw7FD4MuBoj1sVq4A38XNzwoNh4drEfuQLnvyHU0UWAzEER
    0/4sDUx/ru4772Ka7asMoVI39ZZKd+VMgg1hWK6dIhZQusAVxfVVXcRBOYa2HO+ODWkJJk
    yHhAg0/yNzYdXHGAfMBwRNrzlT71WYs3yYVuMgiUtP2W3xChnosbmHTg8oFgQ2A1Wly06T
    4FJ4LnlTHRsMOa7D+xSMU1HYoEgWvMmfr2TX4b/cJomuLFseYhxG8OoKH52UP023qwOdju
    OXU/rstS7rhtjzYoEJXl0iV73emRZjJYCx4fU+8YffGbrnO3MpCKZE18sAT5Y8FQUcxkVi
    gOd9Ye6RcDoNFMyPc9eKbSz0Ntwd9lt3pCFSxcmEyrm1xUkbI7kQIU13hAiY7QRVsDGZ3w
    MLjUJuiXF7lrFYYtA+Uk2lkbCo3JpWb0eeMr21UcrDPfQ3q1OuO13/0xapduxh0EOx5ZKz
    AzNi1C/daJAUAlTkwWvNE2oarkNe5WErEMnJtCrw5mQhgyKcA2troNXK9HqN8JU7ZNphoa
    rQnxuSiEIxK4WY/zpd7LmSHG6MRvS2ebD33d/lkgLortuG/jXaQDedowMbkQ
X-ME-Proxy: <xmx:nGr1ahnGhNSr4FzptxJsS4_djP_SITwZbwIIgTdu6g6H5GCl3lZdQA>
    <xmx:nGr1aiYuQsfIJ9UNvMD4tHZlUHhp92ePdBhAJ0tsvBhd-LVYM3In7A>
    <xmx:nGr1ahNS_d9-LNiv0DwFTrBW7SIySjRPKl8etJxhbQGqBdOgdZIMxA>
    <xmx:nGr1aidCo_l8iDMifNF071yQQ5TkBpvrB3t41x3zD12lr0Mj7Mzv9g>
    <xmx:oGr1atPBQrgBZMfEnO70sZpJxtfjXWX6JfXMabrdIR7Zf8qDG6wV5BbS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 1E5CE32A0099; Thu, 12 Nov 2026 02:28:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: ARWrktkilFtV
Date: Thu, 12 Nov 2026 08:28:05 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Linus Walleij" <linusw@kernel.org>, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>
Cc: "Mark Brown" <broonie@kernel.org>,
 "H . Nikolaus Schaller" <hns@goldelico.com>,
 "Kris Bahnsen" <kris@embeddedts.com>,
 "Mark Featherston" <mark@embeddedts.com>,
 "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 linux-input@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <1ce5b6c0-5926-4330-bc45-593a119c65ef@app.fastmail.com>
In-Reply-To: <20261112064957.1796975-1-dmitry.torokhov@gmail.com>
References: <20261112064957.1796975-1-dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 0/5] Input: ads7846 - drop platform data support and cleanups
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_232843_621302_2FC1ACBF 
X-CRM114-Status: GOOD (  10.42  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026, at 07:49, Dmitry Torokhov wrote:
> Now that all in-tree boards using ads7846 have been converted to Device
> Tree or software nodes, this series drops legacy platform data support
> and its header file, simplifies sample filtering by calling
> ads7846_debounce_filter() directly instead of through function pointers,
> removes redundant memory barriers, deletes dead code, and cleans up
> minor coding style issues.

Nice cleanup!

I took a look at the patches and everything seems fine to me. The
spitz.c change will of course conflict with the board removal but
I see no problem with that.

I did not have a patch for this driver in my cleanup series because
it was still using platform data when I created my list.

Acked-by: Arnd Bergmann <arnd@arndb.de>

