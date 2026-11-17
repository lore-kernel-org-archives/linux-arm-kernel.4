Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82ED606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eLpPPLiE;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hFZpR8U5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rdVP8970YC8GrPU7E70d6kuddX0/TeiUXS73Mp4QXYE=; b=eLpPPLiEX/obL/
	onVrc8wHinGsWeT4x/c/9+h+whWiqHErGl7phg68J8RQxV0Pfi/ubb78l5iCbnFzgP1XGuBYDqkJ4
	k5a3y+vAs8q8ClIus22lGv6x/oh8ZsNZnLbP3tx93CEsN6w9e3eYAmlXYRyvnKUQgOVpL+CG5sHbL
	95OCQIyWrgqXSXkdVLZ8SidYShMH6iISBTlTW6Y7b3JNtULzDsHMuGjSFGqVXm+xGYtqnhkK1S9fh
	n7ByE1pQ+oSRcb5UqaWjY6G/+tZkEcuo9zMwW8xT0lS0F7LhfMZaAQRkS7iHHsMUfpA/l9zPAPO1r
	PzNUa7bImNw9PKvx4q0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMTM-00000006U0d-0CfL;
	Tue, 17 Nov 2026 16:55:56 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMTI-00000006U0I-2nCv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 16:55:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 26E711A167C;
	Tue, 17 Nov 2026 16:55:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD2005FDAD;
	Tue, 17 Nov 2026 16:55:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57B9611BC0039;
	Tue, 17 Nov 2026 17:55:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794934544; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=rdVP8970YC8GrPU7E70d6kuddX0/TeiUXS73Mp4QXYE=;
	b=hFZpR8U5WBz2fvhgHtJ2bmkXXlurn8Nla80rAyBtouwTNPXOU5wPF0wRFp6bGEYWszl3WI
	JQbCD5jDktDOG7RtVsgMSA60TUe6i6qUAKnx+zJMwXXHVOk7UACGAT2lbpiYiEcA0AR8/+
	UC8+co7BNuh/+Xcdt/rcaGKAqzooXBcc+AujYeK1KV8vIy5HWYD2iAKf1e/Llm0S/6K7zy
	DhhRnXedvLLxqjXF3ajX4zJ98glkEMso9dqOzEstJPe+Y2UOljBCEXWSgEBOvqxmuVU1iz
	OdwfBy5932FU+2XmRxXzNcTlW9DGqtbMw1LdHFmhs/amAM+YsWeXyzCaq06uRw==
Message-ID: <3c907364-7adc-4fb9-a990-674563e1228e@bootlin.com>
Date: Tue, 17 Nov 2026 17:55:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] net: stmmac: program the FSM timeout timer
To: zhu xin <zxyan0222@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk
References: <20261116114923.1157920-1-zxyan0222@gmail.com>
 <6c323fca-5d38-40f4-a923-26bdf43cea7c@bootlin.com>
 <CAP7veT+3eNY82uka0-x5MzburF_x7tyvvSdGnhQP9_EYs-Os2w@mail.gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <CAP7veT+3eNY82uka0-x5MzburF_x7tyvvSdGnhQP9_EYs-Os2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_085552_849819_42E9BBEC 
X-CRM114-Status: UNSURE (   8.70  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/17/26 14:19, zhu xin wrote:
> Hi Maxime,

> Right, ntmrmd was indeed added for upcoming glue drivers and has no
> in-tree user yet. I'll drop the field and just program a hardcoded default
> for now.
> 
> What default would you prefer? The databook doesn't suggest a particular
> value for NTMRMD. 1s (NTMRMD = 0x6) is my choice because FSM
> transactions complete in microseconds, so 1s is comfortably above that
> to avoid false timeouts, and it sits in the middle of the supported
> range. I'm happy to use whatever you deem appropriate.

1s seems reasonable to me :) let's go with that,

Thanks,

Maxime


