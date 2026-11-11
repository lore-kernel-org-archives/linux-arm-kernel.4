Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34707606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kg2gRNWf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMK62Tbd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GZm9YwB3NBsRU5kio5p9Zt6AIG4QFJ8V49dmNPDMGHk=; b=Kg2gRNWfi9vGxN
	J+Ze24MGEOQ2SpJCTkGChmfo7TtyXlsL3xZcanG7+xWW1Nh/92PlyekWl0XTM+mYR8TCV9XYFi4ZJ
	+xm/MC+8YZVLNvWNAayhccqUVWunMhdCoFf35rPe/HRfCQ2E91gZLQd2fxHJZ9apZ6k+u4H6GqQzQ
	LytU5ZA8cafpAAbpUHz24R5WNBa3ZobaGEqYb0rTk36XUx7cRVzZpIVi3RIGvz67D2NAXKLY0jor2
	GjSIDZKFia6TjMUuFYsgHXQ3ZBSBSBdOTL2Le1EYqg3XL7BUQCN5BdrOhDk34rtLWXemRMyuVVtYa
	Uob7F+NiBXPAkbIkMu3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBC7-00000007C1y-0xaY;
	Wed, 11 Nov 2026 16:29:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBC6-00000007C1g-02Xk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:29:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C58442E15;
	Wed, 11 Nov 2026 16:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ECE91F00A07;
	Wed, 11 Nov 2026 16:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794414545;
	bh=GZm9YwB3NBsRU5kio5p9Zt6AIG4QFJ8V49dmNPDMGHk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BMK62Tbd8iKyabZkiF4n7dnDawnlpOiocExyQO9nZhX3dI5nGtA9vBmJitaFUrbzS
	 Mj8YKGaF0LHpBzGZzGVCKlru2XxCGjxG12XmdGgUSgkMYc/xgH9udeHbMZnvnFen6U
	 3UkHw1cWV/wL06KsPt0mol1gZ73yUHvoiex55DxZCQG3apzPjaROJG5ugf+WHekG6V
	 ajuIS4bIsi0uwLLybLhhY4w9xoNjW+sFzQt1+ri5u7R/iIDILPMcGOMYcCHEzU3m3f
	 f06zwbP5Hj9pEh9ylzLhIAsWvs4DznMoufc7/PW+cimnq1P0JKmsUXzIeQbBFjbmbU
	 hl+M3PQewgezw==
Message-ID: <517d9d36-ab3f-4eb5-8908-f50aea59a3b0@kernel.org>
Date: Wed, 11 Nov 2026 17:29:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] Bluetooth: hci_bcm4377: treat only negative
 hci_register_dev() returns as errors
To: Andre Eikmeyer <dev@deq.rocks>
Cc: j@jannau.net, neal@gompa.dev, marcel@holtmann.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, luiz.dentz@gmail.com
References: <20261111120248.21062-1-dev@deq.rocks>
 <20261111120248.21062-2-dev@deq.rocks>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20261111120248.21062-2-dev@deq.rocks>
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



On 11/11/26 13:02, Andre Eikmeyer wrote:
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

Please make sure to pick up tags from previous revisions or mention why 
you dropped them. I added Reviewed-by for v1.

Sven



