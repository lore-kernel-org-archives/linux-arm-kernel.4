Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26647606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uTp3D6jl;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IR8ius0u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=J8S1+me+z623//Nd6X9CqimLEVWZM8pGmJ7TvBk7zCU=; b=uTp3D6jlZrscwx
	ZlUXWLk6lqBO2oj3hBOJsVSScYJMsUmuN3MLnvRU5f6F/4I7B1/M8vbXaDj0qkVEQr+0aZY2DUdbf
	Rw+nkdPF1O7g5CUs9m/H7Z52E5+mt2AJNdliTuSQZbaOntZy/Golmc5ToxewU5eNSKf2vCgRBCD8M
	ky5viX4U9boaEx+rVdp2r10scxiD1IQi5NIFAb+IZwZ8orZ59tlgyzqxXEP7FWOt/OW3N6nUv5teD
	TdcLn8lIAbGmojKoZ59juXTVZbnND7aX02W2/uOnOpAaJs0H8ddOs7a+/Apbsa3TLsQpE3Fvk9X2S
	WDklvcLzdICOOtP+uHwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQfG-0000000FRwX-0Vnv;
	Fri, 20 Nov 2026 15:36:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQfF-0000000FRw6-06qo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:36:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B5264017E;
	Fri, 20 Nov 2026 15:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB1D1F000C4;
	Fri, 20 Nov 2026 15:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188996;
	bh=J8S1+me+z623//Nd6X9CqimLEVWZM8pGmJ7TvBk7zCU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=IR8ius0u1OFCFaBLXm0Nij7q7DUAgDPb4UddjIar4rhOi6WstBwNZxhPxBTgfLo6H
	 zBLeptmeIaaUChs1Wk8pDwhxBF29bE40E8WhW1X94GJS7EN07TnB/QwqNtQZ2qZt0X
	 qN0CuUan7pH2o5b3UT0yB6Fr535JKTN0L1I5hap3DRvlXPTI1+p+QQa62yNrpXn4qL
	 VFsQuY7psN9Yj6sf8q55UqSAB/Hy154ykGBgIU7A1TKV+oNLVjH9+l3hj+i30On3K+
	 TbKlK+chKJsmf0L/UUuBWSLKRGA/Sz6NvQkXkZelyf3xTsy2cbUA6cVYg5BTJeW5kI
	 rVpQJyupDBMQw==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] Revert "arm64: dts: exynos: gs101-oriole: add
 pd-disable and typec-power-opmode"
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Juan Yescas <jyescas@google.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com
In-Reply-To: <20261105-gs101-tcpci-bootloader-dt-v1-1-4b7e373778f2@linaro.org>
References: <20261105-gs101-tcpci-bootloader-dt-v1-1-4b7e373778f2@linaro.org>
Date: Fri, 20 Nov 2026 16:36:24 +0100
Message-Id: <179518898448.24590.9385388024279138198.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=482; i=krzk@kernel.org;
 h=from:subject:message-id; bh=JAP8imheMr37qpL7NTHR/Gfz5NUBJJMqftcLKN+WKVg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAGj69dUMr91LVgTW+W3B3cq8RI+MdoRg9Wm9G
 3RpZlRoOJ+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawBo+gAKCRDBN2bmhouD
 110WD/9/2tsbWIvbjbIYO+PWMFrxEyCquuMM9Noya2QXMPW2eIWdwgGFFCJMaau6hhbD5io4xMx
 ydIoJj5XdYyPlCOgQbo4e5J61zB5VCRfbxYfCTVSewKtYsFjDGHCnd7b9Y7f2FvMJh83hFd2RcN
 Tgo8stvMhIGQ5cu5SCWoqRNSQpZC1Iljh2wBtCViV9yocixyyL3lq1IwxvlHYj9ui8UtiXQa5ss
 vIpvtPM2d23U1o0K+aZD4QneU1VxzF4KO+gChknrTFyYOTEQxER07RywAD25bgBpzY6vijyS2Bk
 4qNlmvppE3ke0m3w9DOyHSfMQSXRJ/UKk0CcGl9NzdHLZVaXLPLG8i+7Iekg/mJz3Bj6mK0GqXz
 m9FYhTolWjvBtKhpbeyOIP50sHVO6fuaej2HdchH8t0Kib+FgALmMibZCu45TAt0tonqERbMUfq
 OL5dircTdQvlo2aCZsqpP535eo4sO0ZcGYhS/WN2zTebWyQvN1ZfEd9rD984eTqdbV70Tdh/dLD
 oeRRqaXpx2tJEK0vD0H8N1pRTiMPoPrFZWFFoDSFo9IllzLnv1ubiklhVibx/nLRGHhF7+wMm/s
 V62cwNymCqeb1IcbMGouuELYSGBGOeJjBHRrW96EIHlyYWGMtfITl5MZZwgOKjnsHyAObFVjQxu
 YJ8RRNG3njZx/bw==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> This reverts commit 817473b6ddaf9eb5f2bc7d6dce9fa13a921477a0.

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

Please use correct commit subject style and commit "SHA (foo)" style,
the latter pointed out by checkpatch likely.

Fixed it up and applied.

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

