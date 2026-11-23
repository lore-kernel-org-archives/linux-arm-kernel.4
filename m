Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74705606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N10OpigM;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=nZXPQ0pW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vi9YIEkgcpNDo67MMyhT4GNsmJycA+jIPzIUFtZs4+8=; b=N10OpigMa7aZ0T
	9rSbQLY4vNthXJKrGLmgjcVcVXoOeERxh6DaSGcolboOswwBJhXpSeiRKuyYTVLOOZ2MtuixgwyCo
	BgrDye56UXNb2vVv+24w69+93serFdvXbXkm4My9tL8+ki8yj6CLprh9UQWYJvRGmHmX2Y772De1a
	y6jHR72ICZPY2+XUi/TjVE8GWeyW7rHN68lZpjE7fkNadi6mS6eQ/kQbX/ikW708bvrm0TCCHwTAP
	7siCVAvzdH7/7xaYdK69vKpargjlyVKdvPC28PTShTP7l8r5V3xUpatI1gkqL6xsUVbn2QidNumtS
	sByMz8JoKzxRfXQN3LqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQgm-00000002par-1uqU;
	Mon, 23 Nov 2026 09:50:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQgQ-00000002pF5-2Fqq;
	Mon, 23 Nov 2026 09:49:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795427396;
	bh=oklZcB2ZgODd1ccU587GZpgoAJhA7Noc6dkU+5Gv3MM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nZXPQ0pWy7EEBsRu6tuBGZHmF2oIfTurhP+6ee3Bl9Qqjfpoyiy0xPCf+q4QNLYio
	 mA37bJr0KWyITQFT8bEmRA1DGUv3+wDw1O78meVdldFoDhl9TEOmUHPOl/SJZs/1Nk
	 ctscHYRJSAk0agzND9uZ+vn72PaOS6lFNsgZJwg5mJsLx9nW/AnI4l6PToSletBKfO
	 K1kc/i5ukSZ7jg7ZyEa7LwIPK/Q9woZqVcXzk1Y4ogftHtILq0nbvNGZUFlaqrgQvY
	 lMiH/TVkYM8n0hSqMF/RICmMK9FbdxjR2wMKotT2QVolkkFCZdLycy8nAEp00YzAmf
	 7vEoPWs7drgUQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CF2E617E0DB6;
	Mon, 23 Nov 2026 10:49:55 +0100 (CET)
Message-ID: <db39aa16-0a42-4588-9efc-06e894bb506e@collabora.com>
Date: Mon, 23 Nov 2026 10:49:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] arm64: dts: mediatek: Add MT6895 pinmux macro
 header file
To: Alexander Letuchiy <asalde.le1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
 <20261113-initial-mt6895-v2-7-4ab0aa9fa391@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261113-initial-mt6895-v2-7-4ab0aa9fa391@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_014958_762087_43B8E474 
X-CRM114-Status: UNSURE (   8.85  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/13/26 20:05, Alexander Letuchiy wrote:
> Add the pinmux macro header for the MediaTek MT6895 (Dimensity
> 8000/8100) SoC. It defines the PINMUX_GPIOx__FUNC_* macros used to
> select the function of each pin in the device trees.
> 
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


