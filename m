Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E67606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=syucVnB4;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=E6nTjQ4n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PjWzcBhkkgVIs9w69hUJsb5oT+L/Mcad55T5JmI+iio=; b=syucVnB4z/lER/
	IIY+pjOB/YQGJue0YKREuhFOQC7W5XXC4G6v4R1SH3LwStOebUVhZTxsSvTV92VLPrsffpIfr7xW2
	I4cNZYjQNBlYlRe94tICPS+xIopn0307PqVnUsBUDhRQ2JhlIo7kYQKF7ZxCVxK+GMFPIF9fbnJvP
	eI8b2kJQGC4++CyTJe+4iGFdrsqMpDCjcjDbi3kKevwzqLov8JGN2iW5uP+CdoPPiJ38MJ5hTU1Fv
	Y4Vij/aIu5/6oFpuwoaLS/Tr6Nm5qtfd7ojC6PMG8RQMS0HcuePJZQjyEkQIAejjKkJmdbuM1UyLX
	YTa8ViIJATTwdkUZWOnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK8O-000000067ob-3WBQ;
	Tue, 17 Nov 2026 14:26:08 +0000
Received: from mail-244122.protonmail.ch ([109.224.244.122])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK8J-000000067nP-3QsE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:26:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794925561; x=1795184761;
	bh=PjWzcBhkkgVIs9w69hUJsb5oT+L/Mcad55T5JmI+iio=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=E6nTjQ4nXY2wVq8ILFv7CKNwzPaPG0s6BsRHUl6vP2rMAqimwzcmGMPcIuVGbu8yr
	 wIDiF0PcO4R5mHmcjBVci6m6fnj9WylW7dDEV1IA/Z5la3tGcyizTXgMYk+b8nmje5
	 ZUrT9NfAs+B/8H/2cGWYFhzf3JoirIFO1+3tDhHS1u4VqM6ojhmsbpfNlfuqzfR8OH
	 WA7oYOXCYAgRBby7IHCQ0sWauKEB7c7Gdd/9fZ2pfp5aYQJ0Vy73wYccwfwDVqj0RU
	 Na5nQ8yRUI/uNdBrytUKlOacddP+Dc6e6xaDZuqX8jJXEfqMJ4tg9mSr5t1v4dOLJZ
	 d+LKVymCLGorA==
Date: Tue, 17 Nov 2026 14:25:55 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Houlong Wei <houlong.wei@mediatek.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/3] soc: mediatek: cmdq-helper: add legacy GCE ISA support
Message-ID: <evZkmv2okbTXDrodokQupcspmC8Rk0aHgHxz_-5P_lHqNZ9vat-QT5bZTP1-P2zGeuhCCl9Qv4BdGN-LM0mhnAPz3ibpy2slzjvFgIH3eXE=@protonmail.com>
In-Reply-To: <39494ea2-7fb5-4414-8560-47ddd40260cf@collabora.com>
References: <20260907-6572-gce-v2-0-412a5b037290@protonmail.com> <20260907-6572-gce-v2-2-412a5b037290@protonmail.com> <39494ea2-7fb5-4414-8560-47ddd40260cf@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 25c3788f3b699fde6da1f692dcea107b1ebc25bc
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_062604_006567_69BE2645 
X-CRM114-Status: UNSURE (   5.17  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.5 (--)
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

Hi Angelo,

Legacy ISA patch of this series has got Ack now. Can you please pick
this up when you get some free time?

Thanks,
Roman

