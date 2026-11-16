Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A30C606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=woLV8ahO;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gigmzPiC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JgdiOWBAP1/nIji7HgxFrYPJWlr5o/OvklSC1x3arJE=; b=woLV8ahOykxGpRrLHq01BQKxpw
	2qXudejTw2rMZImyQ+OtFpexCBTTMgrcIaJ3idU3IOsgueJhTHqi0zsOEBQi1mAN0yoNJTFhy5rb4
	PUufRpWxBB7oIf8Kl/nJ7z/Tyn0y9goKj+Gq661C+1bmxQz/wcNjrM80mXSp1k0NfMmHGhohifcij
	wubZTDpBKTHZWK/HLMjJAk1cvXcqIFvz6HIwb+3IJ7WKwWcndswHoB+4F2zGlwER6rG15BOi2hEP/
	9y/aSNPZlqfckglXOWDati5zaajsXiB360VFBF+B6Ucbz1CH+fsemyb9FqJrdTwELG1fh+beDVaDm
	1um0cn5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStMs-00000001q4n-0ZPP;
	Mon, 16 Nov 2026 09:51:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStMq-00000001q3J-2hB0;
	Mon, 16 Nov 2026 09:51:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 66FBC44F7F;
	Mon, 16 Nov 2026 09:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02031F000CE;
	Mon, 16 Nov 2026 09:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794822676;
	bh=JgdiOWBAP1/nIji7HgxFrYPJWlr5o/OvklSC1x3arJE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gigmzPiCqtr8URfsrCJl4vkcs05v6/AEdg68SwNTNsranfvU8IZZ1wnH2l+aeT2DI
	 HcvXlTmZWCH+hz1LVM2Ip4jt4PMn/jbhJ814nW4dkLZ37nhpGxl9he+CGi9JY/hwo6
	 RO38BOaqOrBhqMy7+2bftUddnIs25FlmPdCLrqm8GOsUf871VpOmtxR/ep2Gsrlm6X
	 flhYE5VNkgYVhKFlntkiEc6DQzlYd4OhNLUeCRGfXtCC/WPf54L6GUXyZzY0/pYBH5
	 WH9SUgmvLC0NLSiKzqm37MEAW3eMkcMfhmziktJHaMSBOa0DXm3fclQblG4WTBS3N7
	 4zGS+Zfw9sZsw==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Alexander Letuchiy <asalde.le1@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean
 Wang <sean.wang@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Wim Van
 Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org, Alexander
 Letuchiy <asalde.le1@gmail.com>
Subject: Re: [PATCH v2 6/9] dt-bindings: input: mediatek,mt6779-keypad: Add
 compatible for MT6895
In-Reply-To: <20261113-initial-mt6895-v2-6-4ab0aa9fa391@gmail.com>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
 <20261113-initial-mt6895-v2-6-4ab0aa9fa391@gmail.com>
Date: Mon, 16 Nov 2026 10:51:14 +0100
Message-ID: <xhkdbo6bpqf3h.fsf@mkorpers-koolstof.csb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alexander,

Thank you for the patch.

On Fri, Nov 13, 2026 at 22:05, Alexander Letuchiy <asalde.le1@gmail.com> wrote:

> Add a compatible string for the keypad of the MediaTek MT6895 (Dimensity
> 8000/8100) SoC. Its registers are the same as on MT6779, so it works
> with the existing driver through the mediatek,mt6779-keypad fallback.
>
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@kernel.org>


