Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA97C606A882
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 17:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RoejFXEW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DiOGWW5A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bonakH17m6oL3I6u6f22hNg5N1ig4SK5E1SkaoENsVo=; b=RoejFXEWg6x2Al
	nGfHVBQmXQAReefHRp7Jynoh5MWwk5lpElLmAo+S6u40MNnH7OZPO53E8iWMEyF5HXMmA0f2KHu4k
	J2cmD0Uui0jfk/fLZye5kkp+50uAFUa0HrGkZYcAsJRNnq/rArjjkgH6C60/m43SsoOSfmzwRNEYv
	dDQYWI3fyfJNTzvD1PGIg3Ia2zqyw54760lKt2XKYAhWrmj6xVonaOLnnGBFcAX+LMQ0SaSu1ZIwT
	Z5QQtq1BFNWOpYOerQCzq3YXM/JCSwSZgA7ii7pW1D1arVeczVb4oOhiWKkCqQBiNWgh+9bWC/tUK
	n3xhrDEwglr33KPiYwPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuq2-0000000DheH-0VuL;
	Fri, 13 Nov 2026 17:13:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRupy-0000000Dhb7-20HN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 17:13:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D6D3443286;
	Fri, 13 Nov 2026 17:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD94B1F000D0;
	Fri, 13 Nov 2026 17:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794589997;
	bh=bonakH17m6oL3I6u6f22hNg5N1ig4SK5E1SkaoENsVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DiOGWW5AblLFcTIFUrgE/alIXAiZXbzEhZbiIXhFXE8H/zK//AjmvQiVdRU2ZBZgw
	 YuJtKCusYKUus+2whWriFHNVHslI4dDXzhW1FoNrjObxZxHsLlCS8N1f5Urk/+nfts
	 I/1RB4QSNgC15X5zSln0RFNaKLZZPGo61aGvqrJIcDn2grBij96TZGAaEHDDVV5EcL
	 59io1+xQ/4z75IqkElQ5J3bpoB5fdF0/+oKbAZ5ezCRVzInwE5hqaK8IddqaTjdh90
	 3/Mz44iAuaK2JQreGJJI+Z9XcEA1a77Y7iTR+7v2NixTB1vJ/Lo7rt8nM7TeD0hY96
	 Wn0fc2K8hSecA==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Michael Reeves <michael.reeves077@gmail.com>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Hector Martin <marcan@marcan.st>,
	Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: (subset) [PATCH v5 0/8] Add support for Apple Silicon DockChannel internal keyboards
Date: Fri, 13 Nov 2026 18:13:00 +0100
Message-ID: <179458995719.5774.15567568274381558619.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
References: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 08 Nov 2026 07:25:05 +0000, Michael Reeves wrote:
> This series introduces support for the internal keyboards on Apple
> Silicon M2 and M3 MacBook models.
> 
> On these platforms, built-in input devices are managed by a dedicated
> coprocessor running an RTKit-based operating system. Communication
> between this coprocessor and the main processor is carried out over a
> low-latency hardware byte FIFO interface called DockChannel.
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (apple-soc/drivers-7.5), thanks!

[4/8] soc: apple: rtkit: Add tracekit endpoint
      https://github.com/AsahiLinux/linux/commit/6a2cf965b53f

Best regards,
-- 
Sven Peter <sven@kernel.org>


