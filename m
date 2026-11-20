Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C19606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 05:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gQaI6pth;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=fSP1q1Gq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=J2OGnbZI2RyuSc7mFDxV7TFFnaltYUWFL9MIdYgF4mU=; b=gQaI6pths+85hd
	I6mdU/HTzfHEYIw4seSL+8WCu1GRbvb0LzuMcocMad4adhuqsxFU2qTA6MgoHvMdWcD5zkr0QeCKq
	z52g+/Us/Y3NoVGXUfEa2kQnifk5hqj/JEHmAbbggNBjIobz/58s6Pe1E1V4AZQgIZUIKpYgVHK+V
	k78Vzh4eUeR8YgbOgFVUofxfHUbvgsWlYcxJTn2GWDi9EpHnlh53MrUmImFRdaYSLCh5fb31Yeads
	Qbb/zqosEy42i6haias4MB+6RQj3Hr+JqprJF5gDHDtthcJ7jO3wwXWleKeHQwHwRksUkD4gQpuW7
	MhLn1bBGVUNwgmWkLG8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHBH-0000000E4IS-44UQ;
	Fri, 20 Nov 2026 05:29:03 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHAt-0000000E4CJ-1smG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 05:28:41 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jW3lh5G1SzKnpn;
	Fri, 20 Nov 2026 06:28:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795152512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J2OGnbZI2RyuSc7mFDxV7TFFnaltYUWFL9MIdYgF4mU=;
	b=fSP1q1GqB4YSd3yYZpZD7CoBk3OXGzxXXVYV5tFve6hGE1nuB4TZFnGKVErFNRvpVqNXR4
	WClS2aKJwimDXHWHKm0uW85Z339XgdeKzNQe26FiIW6N/jIUiL/BojSFiGZnEiScXnFzSW
	9UTA4caaPFqYl0qoppEQo3Oxhc+u5yrq1kDB1zxL4zkgocgjptjGh9OqkJx/C4CkbgD+WU
	aytnZl48P5hB9tI2k3TgwAoSyPNeKLOoeDU6xfrTGa9RGTgCRh2wAVW4mMWt44cWRQzcEM
	KWj/V6KANVEneIwSy4PNhFNGf0Q+FGPz43WnILOS0Et6nBPrKO/Lz73ZT2YCYQ==
Message-ID: <702afd88-3383-4f6f-9a54-78cd95a80c30@mailbox.org>
Date: Fri, 20 Nov 2026 04:36:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/15] pmdomain: renesas: r8a78000: Replace sentinel by
 explicit ID map size
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Paul Elder <paul.elder+renesas@ideasonboard.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1795029012.git.geert+renesas@glider.be>
 <ee60a54c457af21277a13e8e1db36ce83209b3f5.1795029012.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <ee60a54c457af21277a13e8e1db36ce83209b3f5.1795029012.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 0eb81db9691d4bba056
X-MBO-RS-META: jtxh91mtydrj9pcr6axxbzggtj71f7wm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_212840_012018_4E2E5FC9 
X-CRM114-Status: GOOD (  10.30  )
X-Spam-Score: -2.8 (--)
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/26 8:45 PM, Geert Uytterhoeven wrote:
> The use of a sentinel in the module ID mapping array will become
> cumbersome when the need arises to find out the actual number of
> elements in the array.  Rework the mapping data structure to fix this,
> also improving naming.  Let mod_id_map_find() return an index, to be
> used for indexing additional mapping target arrays later.
> Add a MOD_ID_MAP() initialization macro for brevity.
> 
> While at it, drop the check for "!map" in mod_id_map_find(), as that
> pointer can never be NULL.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

