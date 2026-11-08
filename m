Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED64F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 21:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NWsXekGx;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=bKFTBrIk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vRqoz4twlcmki9bQAdH6onM/XyHMKqGBzKdWek7mXus=; b=NWsXekGxbBnZcu
	bjwhv6H0de5Kt2TanqdyWuv+CBsyeG0zLPzNyIKwZrDdC2YxIEXiws9fyUHJW8HFTw4lREWdiK2P4
	YpTxxNxRt0A4f8QKtqDrKk3L8kWYyfhA8EmfVyetUU5M280a2C5Au+maxhxxEKByC/8HzBcjrNx3T
	QewRKFBNpKMY8hVArT4cTeGG2odd5izvbQEfVd08RxZuY2veYtSA/TSeypOzSzFb58z3ncwp2w0Ks
	xuqbn4Ob61KH1edNyVcVyYr5PXi9rKyFNLDR9GSZhP59cobSyzVKZPr26woQlreWo997zp2zOeb6V
	axjppLkiA4ZqSwuaV8dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA5q-0000000GfcG-3Vfw;
	Sun, 08 Nov 2026 21:06:26 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA5o-0000000GfbG-1Ugd;
	Sun, 08 Nov 2026 21:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1794171974; x=1794776774; i=wahrenst@gmx.net;
	bh=vRqoz4twlcmki9bQAdH6onM/XyHMKqGBzKdWek7mXus=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bKFTBrIkSjdSXNYUGXsvkZjqC29QU0b96pysqlXhbasUleKESaKfj5FYAmSYUdwf
	 4z9bQTbQEVB5zTxHNzWngunUXlGDX9znsQHmNiCPPwMKsS+4viOMuq/IYohaoP+Ob
	 el7fUAyNPO+fxcLkNyxaK+WHbuEKAodkFaVh+/2lOWrfHX18ukT/pfLPRUlJghfUR
	 dTjYCTkiC+qL5g/ZOTvuTiTtHNSQ5+3GJ0n/f5hxaf7hGeZtKyAK+S0CdpnGyanZI
	 M3b8esRvGE1vUnAEYwjgbvBmIluawBepMx7vCZklYZL0Msnq9tYONCquZqshmn8K5
	 diqCERASpD6mQSaA4w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MaJ3t-1wweK83vNN-00PhkM; Sun, 08
 Nov 2026 22:06:14 +0100
Message-ID: <63ecdac3-f8b3-4d44-9b0a-37346568d326@gmx.net>
Date: Sun, 8 Nov 2026 22:06:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] firmware: raspberrypi: Store child devices in
 struct rpi_firmware
To: Sander Speetjens <sander.speetjens@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
 <20261107-fix-raspberrypi-firmware-v2-6-5bfe605a5cc5@gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-6-5bfe605a5cc5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tO7j87bznML/Vs7IMVxjX5uN6l5u9fE63RkGbOxIb4ds+FND8rj
 Spq21myjsyV0Rb9iZ2DpBonYjEWGRtOfpR9UKK7KZ91mpAVw8keX5MwWlW9larg3lDGRQLT
 XciULeo3QM7lY1eQn9WtKaAtTw/IJG0ntYCxBpHCsATqcF1ucvyutgDXxSQwEpFWf8ibMXv
 HLw/l/MlZrj0xYSTQLWfQ==
UI-OutboundReport: notjunk:1;M01:P0:KI9kB/VzqK4=;6Wq7k2LaMJxGgpDxJNXIifKAtei 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_130624_690501_50D43B0B 
X-CRM114-Status: UNSURE (   9.23  )
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sander,

Am 07.11.26 um 19:21 schrieb Sander Speetjens:
> The hwmon and clock platform devices were kept in global variables.
> Move them into struct rpi_firmware so each instance owns its own
> children and their lifetimes are correctly paired with the parent.
>
> Also check the return value of platform_device_register_data() so that
> an error pointer is never stored.  The child devices are optional; do
> not propagate registration failures so the main firmware interface
> remains available.
>
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>

the first version of this patch contained fixes tags, but they were=20
dropped without mention it in the cover letter.

Could you please explain?

Best regards


