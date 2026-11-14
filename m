Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243D0606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 01:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SR+rQifI;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=sOEzV1DN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C0oAlm2vEYleIlt6mCJn4j5fnbEYzFEgLIf7M7v0Fow=; b=SR+rQifIMoSInuO/nuyH4T9hen
	ocSaRwUasdg2U2K/PA4obi8PbIbhJ1zTj9D09UQeVuTNFYhSyAqiRbX5fWXZ5n3t0WFMUczJHZFCE
	xnd+LZjOAXJbHFJp4IWqv0fGYW1sy8g8e/aHg6UUc5TIn6SnQ3NFgx4H8bmzuR/H37VaNVN77iFVB
	Uj/0jEteM8jadxVGJO9us0XIVV4JhMOO3n7c70qhmHQ5Dg4pRO0ZscxVDOMwdHaOtREEBviYx3ytv
	wZLvYBMLL+kLlF2mK4AzrmI9+5CBMHt787CX9ZaCqvxh8XLn4GTmy/61buKOLF88pjBmMM05X9Y1v
	yM2u5t6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS2da-0000000F1TC-37Vj;
	Sat, 14 Nov 2026 01:33:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS2dY-0000000F1Sl-25gO;
	Sat, 14 Nov 2026 01:33:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1359361849;
	Sat, 14 Nov 2026 01:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 646C91F000C4;
	Sat, 14 Nov 2026 01:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794619978;
	bh=C0oAlm2vEYleIlt6mCJn4j5fnbEYzFEgLIf7M7v0Fow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=sOEzV1DNGsl/FwRVquOSpT6jHSbpS2J5CTxyR48F9L1D5qiPdPE3uX/gk9oRFmt3V
	 0snbZmjOcMUggp3XX+OxalKSdRIZVgtQlkkTry2Soo+LIYxBfHe8ipPOqCwGD0hnry
	 8Oany7IJav4xzKA4UdMiDYIxGeQ4w0wT/hrSyfuQ=
Date: Fri, 13 Nov 2026 20:32:57 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Saravana Kannan <saravanak@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org
Subject: Re: [PATCH] driver core: fw_devlink: Don't report refused
 sync_state-only links as errors
Message-ID: <2026111347-poach-boondocks-a547@gregkh>
References: <20261110-fw-devlink-sync-state-v1-1-6385be961c2b@gmail.com>
 <179460189995.183918.12921536578133287930@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179460189995.183918.12921536578133287930@gmail.com>
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

On Fri, Nov 13, 2026 at 08:31:39PM -0000, Arun Iyengar wrote:
> +Cc Saravana, Sebastian, Ulf, linux-pm.
> 
> This message was explained before, and I should have cited it:
> https://lore.kernel.org/all/aixze8zFboY3huSf@venus/

There is no context here at all :(

