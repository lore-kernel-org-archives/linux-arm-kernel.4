Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4600E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 08:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E8KaXmV2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C6UxbC8D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BKdpE8N82YN2C4C12CQTCKi0PcsjjfC5cCXgpPEJ1nc=; b=E8KaXmV2fdeugL
	zVEvbg8lYdM1jZADOUy3ePYL9egvpZ4SqIOWcrzHliZV57FgQ1k678d0Y8oedxVIslr0/eFjjPoVU
	QVkW28QtOEwXwJFETrKob/OpmVPdy8sfUomg0pPpJTYUmlzCYRB0YtQOJd/TVZU3gqEMdySpYckF5
	AUzTUUTJfINL+l+Ql2Kjyn4RN8DFciUbuxQRg6AgCUcZhhn4aihTXpY/C9RFKLzJlgFmInGyK8ZME
	NKyH2upxLwuU+bjzrPChnwU9G+1L3+0InFB6s/0I4OuCyjH2KKGdyQ+aUx7449A7aq9GrsV+i8Gvr
	Ic7mBR+hldwsPekBEu/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbPR-00000008EgC-3UBA;
	Wed, 18 Nov 2026 08:52:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbPQ-00000008Efk-2TOX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 08:52:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D25061FB7;
	Wed, 18 Nov 2026 08:52:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=90.182.112.124
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794991971;
	b=12D/TngEly+xsSnJV+dHNtM1liMKEeH+z5M/oJCc9WzVlPDPEZ3A/BpRUkQ+SSDTQ8Rx
	 TXL4PSO2nw7kuZSJ2q6lS24QIxxl/lTy4Yy8RR6FDhXEg15CQfsPmA4a3rfD9Hda4RqKY
	 LQxO9EndSNrx31XlEQ+B75ZJDJyJnerP5WoVi6+NlMinxXpM1J27l9/K+OPWK+LzZOdLh
	 m+PODYsrtp8AnujX/c2RuyywmmTByx0WVYogDlRgepPVSVg2AWEImslaP8HgOHg8mcYce
	 Oy1bQhn38B4rPJxvKn7ivqBQQlMdZQC1u5SgswQuQ0CNhmxkRCwcnIZgcbdTM+5mWtg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794991971;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=BKdpE8N82YN2C4C12CQTCKi0PcsjjfC5cCXgpPEJ1nc=;
	b=vFUexcnH3P9gTGybj6qoAVqLJEBOXOXJ72BdjzAqkqZJpaqBUgm9tyve9PC5GqH+dZF9
	 Mla3u4LmU5ZZNc+jlos/hRb217tMm6lOin3qbjvsKfCxdb4wsQyZ4b2T86KEN1Xrw3cmr
	 kpoCf43lwyeKAoHxB2B5p8IhTBOAPEzoWGin7qVKsrn4DY2nwSSMs3J5iDXnkR54k4WAQ
	 v/0WsEl0xYYtkOZ3tmKjo4mfLfwmRqndGSunpKAaOZrXarH3W5KWR+1PsiSJM3mSX2Oic
	 WB6OUwEdIIWDW7FL4JX2PKX57h9/uNva2ySOuSNoRzVBCSSdkkCm3QshAwqU5f82XLw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=90.182.112.124
Received: from localhost (90-182-112-124.rcp.o2.cz [90.182.112.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPSA id 135F21F000C4;
	Wed, 18 Nov 2026 08:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794991971;
	bh=BKdpE8N82YN2C4C12CQTCKi0PcsjjfC5cCXgpPEJ1nc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=C6UxbC8DmCyKamtjwu5TEoXexPkOqD4B42RMMVBrrPjBYcQfWlD6e2mhqsxIqPLUw
	 DOJyrwCXwsqCWlQlPz9tfcgJaejS6ejMZY93p+sYajPjP2ow9BFau24igGhIvolN4w
	 0xPr9AB8x2HxpzFt1dMQam0zfmji/mSxnA8vEe1plj7IZsNm0OiDQxA4Wbp/1Xv+Bb
	 625efOiVBBixn+p0PrlsIcAib/PZReBwPkQ7e+Y0r/cFpz4o+IrdpSel5lHuZMiUmf
	 tvOrkL5/gO7ps9v/e2dRi0Pc3JokuVg1xJ+BXwF891vBY8rDG7CWHYI+ESv2RsdqBj
	 7ZQ77dlo3jCww==
Date: Wed, 18 Nov 2026 09:52:41 +0100
From: Joshua Crofts <crofts@kernel.org>
To: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Conall O'Griofa <conall.ogriofa@amd.com>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <git@amd.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v5 04/16] iio: adc: xilinx-xadc: Drop unnecessary
 masking and dead code
Message-ID: <20261118095241.00006111@kernel.org>
In-Reply-To: <20261110050201.1850399-5-dileepkumar.nagavarapu@amd.com>
References: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
	<20261110050201.1850399-5-dileepkumar.nagavarapu@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026 10:31:49 +0530
Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com> wrote:

> Remove a no-operation bitwise-OR with zero (dead code) and the redundant
> 16-bit masking when storing values into u16 destinations, where the
> mask has no effect.
> 
> No functional change intended.
> 
> Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
> ---

Reviewed-by: Joshua Crofts <crofts@kernel.org>

-- 
Kind regards,
Joshua Crofts

