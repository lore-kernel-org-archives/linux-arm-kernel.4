Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444D6606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 07:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N836eY3x;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhhASjcc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bUUKY0RsjD+IVYyi5SJxAofkyIWwSJR0q+NQRX7ZwwU=; b=N836eY3xv2Bc9Z
	SMyR0RrB+SLyGaZ/PMeq9SqiHZRWeu4BY9HBUEZEcqy6GcDCWDgkrhOp5nbJ8L9Q6kqgR8oSoNWdR
	qJHsC7pSEGyMGIA84v+yfRovac2S0YiD000KIP9NW5YTTiFzFvEHSBDGrriVabwBsO179Xq2FQh0s
	8eYcnKHKdQ66hr+v4R3XPdKvjS4q2mnxaAUIrklMMiyFKABMyEFHIZNR+6Djw96ENLrgxGDnZSWnT
	1YK8OSYfQH3GoYkZhXLcrsaDbrQZtNQiOxJ3Poaz89mCovPkw+SAYsYA3uRqBR03PoB2i4xsTT4sC
	so1TUgs53sqMvo8VqNFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkWA-00000005hPo-0xWV;
	Tue, 24 Nov 2026 07:00:42 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkW0-00000005hMJ-2nU3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 07:00:34 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-3ab4354db11so40501161fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 23:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503630; x=1796108430; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bUUKY0RsjD+IVYyi5SJxAofkyIWwSJR0q+NQRX7ZwwU=;
        b=MhhASjccb1QzEUQllU6AZMkr+pEc9/ZEKmEsTmY1dQnVQcudEBz1kpFY7nCjZhWwXa
         8V5K4QHLOflZzFlgsiWIICzEpd8jvL29EfQtCqhGqrAlJYvRawvaGVCOAm7NRSiRF7dB
         5v2v5s8jqicfCoVwFir4efVluCYz4h3cykA7ibhHgbX8bFgH9OUNC7jDd7UWj2ZKJzMk
         UyDVqft4A+GV+98ZPNzlxskNhBKCEkkPwBnLnNcHEjlofnaj2nDFWzSRQzGov1o+sUdq
         6rw1Fe/BYeJyjS4bcMFwPL+AxTJ9iLXQHHme0lZpbLdeSlAuj0RSPR8uMPvwaCzTHj1s
         Lkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503630; x=1796108430;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUUKY0RsjD+IVYyi5SJxAofkyIWwSJR0q+NQRX7ZwwU=;
        b=NspBxiuRfg20h+YOJSmlnTaJf2dEhlD4Q/k+HZvj6eetZ2JqrVBjqo21NkuET3NEvV
         r4VRp53Oto10gFeo0jfcIxABtn2QbCLU2Y5VFJXdzrHbaZCt/bY+89fD4Ow1cl4cu4/s
         cFNzZOA7TSfFceSFnn3GOPSSVBc8D1McOXoNOL0WBOzuhSa8YTPzfHxQF+cOfHGP3me8
         pbVl9AtMDAeqC51vIs/MzXlug3MNy8LcqMBfRjEZ9lk8hVO+AqLDMWXBH3h2+kkZBOIl
         T8RFQBFA1zslV20pouHg4N8x3b9mtD4YSdLYyVxcQGsTBhEtqsn9jN1F4dbJCZb0aqTW
         CTuA==
X-Forwarded-Encrypted: i=1; AL+hErElISFVEoBhgvqj7kbCcfj9yffJLVi9mMx/4+nqE6pvAyOKecyBF0y2xyfcBh4jMdSP0RwTBIq5C0BYZUd08can@lists.infradead.org
X-Gm-Message-State: APuU4Z8kea3aLEh6u3YFxlijGExMvuy3RqStsBHd6nQ6LsD2HdfYtB8n
	JO5HqCB1uRL7V3aY4HkcZtAznqHkYD0/5zE2Vpng47+3OeD4llf0qjZR
X-Gm-Gg: AZFdTZemx/xw8bTcfPI8lZIBVhq7viIF2RUHVZ538IExNMtHmz2OtgpMf2YMRY1Cmlp
	ojVwlSk5uR6YpZB4kH/vtVJn18Q/v8FAWiW8RRcOsuLaH7YgQ4SB4iOoIkRq9ZyvznpOHg2I52H
	RBtrDKXtYQNMthDIzRcVfrCTPMFkyS8+sYRJhollMX5JxPYfCc2Hbv+7GljbkqtCScjUYOU/VW3
	xaTfiRrTxTzjOJ6/WwmyeSNlDgnskxk+EjTEM8XAtl5aiTB0LtEOWSnM8CDgTf41ZrZC4i7mL9q
	bjEl8z+WfSrc2GgW652vWfaSQ+Da+oqUfTaM4IGJgZWn0CaJv7kPPvnmeEijripckFYlIrKFJ9u
	+xAK3wVP2pfuwK1NvP9qbW/t7SDMB3h+TQ9KTRj1XcNKWRPLD/rdNO4wSy3QmNGgRINGOYFhSQP
	Sj1HthV1cXSG1SNNo/bbmXUBWpjU5zLnQSNVYV/mylK29ySTuCGjHcy26p5eyfTvLlDL5Rmuei2
	Rp9D/4M7Yu8ZUlCZdigh3jHkB3EGW7eW5DKZaBb6Lk9Pm800VFcjz/oMtcjmNCqoBdETllJ0FeG
	RFo2g+jt9Si3IZ0Cj1gN+mv+CDAm5Xxl4htAtqbm/1CkMppKtni4oXo=
X-Received: by 2002:a05:6512:12c4:b0:5c1:563f:ff23 with SMTP id 2adb3069b0e04-5c1bc84ebc3mr3803268e87.61.1795503630067;
        Mon, 23 Nov 2026 23:00:30 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd05e235sm3481118e87.64.2026.11.23.23.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:00:28 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] dt-bindings: clock: Describe CS7542 PCIe gates and resets
In-Reply-To: <831a6498-9c1a-4829-b47d-52035fe15444@kernel.org>
References: <20261123-b4-cs7542-pcie-v1-0-4cde5201d404@gmail.com>
 <20261123-b4-cs7542-pcie-v1-2-4cde5201d404@gmail.com>
 <831a6498-9c1a-4829-b47d-52035fe15444@kernel.org>
Date: Tue, 24 Nov 2026 09:58:48 +0300
Message-ID: <179550352887.5.18085137758862458863@gmail.com>
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_230032_716953_635E474F 
X-CRM114-Status: UNSURE (   6.31  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

Agreed. I have folded these controls into the parent global syscon in the
separately posted shared-global follow-up:

https://lore.kernel.org/all/20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com/

The parent node now provides both clocks and resets directly. The prepared
PCIe revision removes this resource-less child binding/provider and uses
the parent. I will let the ongoing reviews settle before reposting the
PCIe series.

Thanks,
Fil


