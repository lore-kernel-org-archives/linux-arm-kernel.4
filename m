Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1352E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rAmeFt0J;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=XqyqM+9n;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hiul0ny6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Dz+hOXXzBRP/gLMriNGtkNpsg1THjB/csTcrFJ0tk28=; b=rAmeFt0JkinUa2
	tlPnqMcw93gWyTxZNx+I9CLbU79mmrbo4qX6dgQbnfCvXDpdpJijn7i6TcifyBjkrqipTe9jdeu1G
	CZC6exVLgBtbv4EcUyb9WTlHiUvdgoWhKoiqRPa1EwKSj6+nMoE8HBsLGfUPXMUlCVkpZz5kwaBdx
	KLWPOe8W43q/bO/nw0cdmRLCB5VJ11AyerSAgfz7myVhAs3kj4nJeCfKnb6JBlyy7rcGA3NSQcI6S
	oolBOzsuTf5CbQB1orQ3DPs6LjWJpAmL+Ct8NIHUTpN+s4lrDZoDYuJ0kpt5T8eTHE66M7hQgCSRG
	4EouBpu0Ghd/KbEbP8oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcUo-00000008UOt-49Y8;
	Wed, 18 Nov 2026 10:02:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcTm-00000008Txe-2ZFh
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 10:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Dz+hOXXzBRP/gLMriNGtkNpsg1THjB/csTcrFJ0tk28=; b=XqyqM+9nI3MupmqMR0/AcsLxlT
	bYyX5aGfH4BxLmT7ROgfGDHFq1Iu0R868m191TltGTXEf3yrBXqe6s89navI5ozwJniiQGaJoxunV
	g5Wj6eoVCwFFanFnm2tjT/pSf3MLKmxfSiY/19vfFQXLet6Rcu9eYJDnjKscgWl30PSndDHJGzQZs
	uZ4Vpc3c9qYCBwy3GTb7Kz59CvfBJqegfK4t/1532ojOyzQYusLwaQXwNB2XP/u51TcS6jSNdgXNu
	JsfXnr/yRi2AOzT53C2D/uzURgyaBbKKihAXZrA4KBpevVm2f9xcnbVkHN3zqO0pfJcgugciLEAnt
	8xH5n0cw==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcTj-0000000Ftbv-38rm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 10:01:25 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48dee593f18so586679f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 02:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794996081; x=1795600881; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dz+hOXXzBRP/gLMriNGtkNpsg1THjB/csTcrFJ0tk28=;
        b=hiul0ny6AcHf35SIkI4idMG3Q+4gle+iMCVDTnMBF/OJZl1tKC9t/aYP3f8Ng9s0xw
         i6QkAZiEYxGJvucIJBzL4jIivlGmfvC9XbkiBhUMCjJiIivrkZRtkOv+/ULOmkFLXvG+
         RD/r8iHF5OKND5ijLhk8Jxyk4o/yHw4XJRNiIu0//ykgxj8dAbh4icU4POnKUb5bjFtT
         6RlirpxGzVDB7/heASHhU7qOGj3u3UQobH09F7QcKiQrYImeYsyUTmRrNNhci61UtN/o
         Hk7WgjZYQYtwp44DIUNSOI0KlyOMCMYZ4QBkc4P/Jf/fWXV/cFWl1ARki9w38sgHXdhc
         pK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996081; x=1795600881;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dz+hOXXzBRP/gLMriNGtkNpsg1THjB/csTcrFJ0tk28=;
        b=AcIyeXOE02JPe8gSAU4Hb0113ioN/6XFQQE8djNqk9W0fj+VWG+L5MIs3HCSZbVP+I
         vXpiR9l6LkbAS6+3O7uvTzAsLOocGVk0hYezqnQr3+QvysEfcoevSJJ5k3ya54ACDsVn
         cC9RlNllks2vkAaYnrJkl8g5lTkRpvG6gfenRr68PIm0E90d9fQB0naKqu+j4GOOK6Se
         36AEJSU2GVZp9l9OmYm1RYdjTYG32Ns0KI1/nQYZeWhtSy1otlejsutX68xNuxVLniy1
         Q5kQsvF5i4xGpzZdwLbGmOsxF5rM01vY5MHTjUKgp9BZIIHu4O6/kgNs8rUiL0AEzj8V
         2O0Q==
X-Forwarded-Encrypted: i=1; AL+hErGnGSAY+js0iauhQjCd5QiEheplFFg6vdI9yvu0oGKYPpD5PcEXBap9ONRRfKWnGE1qaP3LcE8Kk9mwMcA7Qdbh@lists.infradead.org
X-Gm-Message-State: APuU4Z9R5Gq808J4FgMtDJARk5tyW2Yxt4Mtt1Jp5421MGEZKbfzYd6H
	VrpHBXpkkLml+yJraTws3zp7zlA1fO+QJ0pFwVZKGn1IhLl2Ho+sMzjGSV+IoiKlbMk=
X-Gm-Gg: AZFdTZdObhSbV9KO2PSxoc3f0cM8N7xXN2xdHexicuUsoS1YLbUaH6EKIRqjAxIc+n7
	kJL+RcVATXpVI246k2kRlcRhtaHWXofrdaptszEsJ19DhnZW792DDYqLiFZohsK3FDs06f83Nif
	9Px5fWaKEWaRbaECcCmlitJxuX6iWeV5Obv7MeJiCA1FMWtEhugQ6VzH94zP8ZoZa6r0wQDYuAN
	gYAApg6e3BynhW+jWCk5f9VWxKEtavJ/ylF3kZb4kSiXj7LhASgE9T0oltnS7xqhMkrpq2lMdq0
	PZh25KQSjmXv8CxiWDLGq0GGE2a+YSGceVdLuzQBo1086ocXIRhSQx9UcpH1eRckFQYxkCqXsds
	UurhcXKOinGZi4R41JSZZH+NF5y3J2SdbQZ+YvHnzgFKez1c1D/pFaUv8nuGhzHH/0O2HT+JXzY
	lexVEf0NvKN5bEcskVvsNwSR1Ybar6jjq2uL8cu41qfT++LEI7dsOx5RdcziKbAJorLDyQok9Ly
	UbabvMcy7ohF44slOrArMjc19hFvFG5yCg/5U9B46PlOPVCDjkYdHQMS+QRqsMzfIJaP3W08aHi
	MFdLo1FJUq9ETH8r+tfcDRR/wz0LZBQh6A==
X-Received: by 2002:a05:6000:40c6:b0:48d:f14a:9182 with SMTP id ffacd0b85a97d-4a6385221d2mr4182620f8f.20.1794996081159;
        Wed, 18 Nov 2026 02:01:21 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c257sm3680960f8f.13.2026.11.18.02.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:01:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 4/7] dt-bindings: clock: Add Amlogic S7 PLL clock
 controller
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106-upstream-s7-clk-v1-4-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-4-7d501d62621f@baylibre.com>
Date: Wed, 18 Nov 2026 11:01:12 +0100
Message-Id: <179499607256.413320.16082664027719861712.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=429; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=PtXjyJ2j06GU7bMSY1qzWJs0ZQx1vl5iBDW33+FUIt8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/y3M8boiXW+kLOhSXHZTU27xnp5PmcweXk7N8ZknuX
 1v0M+5xRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACZSGcrwz2CTn+HNd5EWG9bu
 uVr/eSPv5Aat481OXnkbIqTyq5p/+DH8Uzpp5HBPWOtsl+SVHVlxdlVPN89t+rGZe5WDQ9zFwIm
 ijAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_100123_809683_6F0AE6DD 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 06 Nov 2026 09:30:27 +0100, Carlo Caione <ccaione@baylibre.com> wrote:
> The S7 PLL controller supplies clock sources for the peripheral clock
> tree and receives its reference clocks through firmware-controlled
> oscillator gates.
> 
> Add the binding and clock identifiers needed to describe this
> controller and its connections.
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


