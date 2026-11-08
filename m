Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A9F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 13:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tx1G2ep1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nak5s6JX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fg4uIh/MG2OfipaWGWYSlCru/4Mi+6sgfqQg3WGOEHs=; b=Tx1G2ep1iscnTo
	LwAziKClolOVdPa/XiyWrwXwELOafCpydxQyoPT9nNDVk5EkdxZNYHQCZ+DyQWf31m8/rYxkoEa73
	pb9cxbd7qPuNgCU9MsZhOtGIkABg7mlNLscdWniWprOD2qsHGKId6DfypxEY9p5Lj6scoK+wNHL1g
	qZJTZpffDsCVkbiTkXRWbR4lBKeApKkl3uz8KprcueOKFcefMVu9MUupkPfyRzJB2vZY698ESLWxT
	t5WAhxHZlXYhBXZGK8K54/Gl9os9rINrdPsr8M/Lspv/RUEW4fkEAIB2h2dNIjREXmKBHhXaeiipC
	wz+HUJz28OU6Rw8nDZ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ2j2-0000000GC46-3PAo;
	Sun, 08 Nov 2026 13:14:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ2j2-0000000GC40-0omU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 13:14:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 25A486061F;
	Sun,  8 Nov 2026 13:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A2E1F0089F;
	Sun,  8 Nov 2026 13:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794143662;
	bh=fg4uIh/MG2OfipaWGWYSlCru/4Mi+6sgfqQg3WGOEHs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nak5s6JXIINDfcpzUQw7iu5+QUcMc5Dqn0XKcOFvQcc9WDYKHEBOtoI2wgekh3BLP
	 J+eH1Gb1VFqVNix5WdY/f4UXeC5i69yF08Uqst8gqOD5YwRPi+ym099YTgbIYpt7OR
	 h1TO4pxaT7Nmy13A8mQr9f9Rwi9kLZbKalvTJw0xVrQMPVTf0ufJ+BpZPdYOvV/axy
	 D3bz57nIX2McRLxqb0f28bIMTEznkldEZ5tLK23ShzpnunNdmFv76qNACTCGvcGMxq
	 xX3XiK6Z3Ib2l8CaAO5w4U0g50EKcl0hO7ovwqxqLXNvfWxbnHU5px0X6UbLXmS5c9
	 z1QdSFNQ7Z3iw==
Message-ID: <98867385-b28c-4eeb-9301-8c284ee8a089@kernel.org>
Date: Sun, 8 Nov 2026 14:14:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Bluetooth: hci_bcm4377: treat only negative
 hci_register_dev() returns as errors
To: Andre Eikmeyer <dev@deq.rocks>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261107154839.89941-1-dev@deq.rocks>
 <20261107154839.89941-2-dev@deq.rocks>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20261107154839.89941-2-dev@deq.rocks>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/7/26 16:48, Andre Eikmeyer wrote:
> If another controller already holds hci0, a USB Bluetooth dongle for
> example, the BCM4377 is registered as hci1 and probe returns 1. The PCI
> core takes that as success, but the devm action that unregisters the
> controller is never added, so it stays registered after unbind while
> its driver data is freed.
>
> hci_register_dev() returns the index of the new controller on success.
> Check for a negative return, as the other drivers do.
>
> Fixes: 8a06127602de ("Bluetooth: hci_bcm4377: Add new driver for BCM4377 PCIe boards")
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---

ouch.. good catch!

Reviewed-by: Sven Peter <sven@kernel.org>


Thanks,

Sven

