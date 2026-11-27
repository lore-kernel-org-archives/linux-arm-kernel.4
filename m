Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AA9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bW2cWwi3;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=er/qFujM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vnq2cvzR+T45NbkeYUki35hTD46eHhE30xnjedOGMKE=; b=bW2cWwi3rTwWEMlIMh5EYdsGL1
	SfVoutxvbiOAvuCsODCxu0IkBJ7kMDgT+zy1svArWjQ7SrvkSL3iOZkOECS4HFD0MVlDLxz8u5Vjf
	7k0SMQ04QLDT/5eFKeZamqUwopyOTDolqLILtHs2qReJftrREOUtzrZHVhcxSm7X2DNCgBw2TaRiL
	nmR6tCjruq0mGeNKBH3PAh9LLJDDyjftY6EZcNcEjyddM7TzSiDX4x8+E2u7yur/ZetE2mCalMUZF
	ENpfDum8B8Exo/d3xPZo9PwDMaHK7lIaVhpZBMjg0oBtcNkp2NlZjKtOolZWKzP62lsc/DvblNNbR
	/D1l+jtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsgI-0000000FUMk-1FXW;
	Fri, 27 Nov 2026 09:55:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsgF-0000000FULs-0duK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795773347; x=1827309347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TJXJv2Jg/Z9T9C0MJjr55Dl/rI7ViwUF25lE2jE3MwU=;
  b=er/qFujMq5d6MCVzSDEJ4RH6s/o9kT3H2VBMU8RA9mlwNWHgdmsTXohL
   S+YBMuj1B70g8KLTMDibMqsihisAF8qVUAyYHH4rTh/gya5szi/ZW1zGg
   6CwHuPH3KLpRVfjXw1HxDwwKq7wzOuJ1D2GOgfh30qqUEyvGUfWLrOW5U
   AujXSbuiqmvzs/FmX7jO401N0BthuD2e3glKZuS4Tw3xiZUU2ccWZTliX
   BgdZOBOp0xn5jj2hXKtnH55hsQ2dyNTYQhLr8LsLo9e/af76h6pPSeC24
   WyEgMlaNTLhjocDSKcyk88HEcJvmwD8ukK5rnlFIF53A4tnu0p5H5oV+p
   Q==;
X-CSE-ConnectionGUID: OWH63shBSoitzScPY++f8A==
X-CSE-MsgGUID: 7H4uBvlmSIWNlr6J5taGAA==
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="66146002"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 02:55:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Fri, 27 Nov 2026 02:55:44 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 27 Nov 2026 02:55:42 -0700
Date: Fri, 27 Nov 2026 10:55:42 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: <netdev-bot+sinfo@kernel.org>
CC: Horatiu Vultur <horatiu.vultur@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next] net: microchip: vcap: initialize the top
 address of every VCAP
Message-ID: <20261127095542.iiiv5xad44jrsaay@DEN-DL-M70577>
References: <20261123-microchip-vcap-top-address-v1-1-fd1953fad422@microchip.com>
 <179544593891.3294.14856771777951641475@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <179544593891.3294.14856771777951641475@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_015547_251323_8DBE635B 
X-CRM114-Status: GOOD (  19.37  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
> 
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Found by an AI code review agent and verified against the datasheet. Not
triggered at runtime, and hardly a fix that matters for stable, hence net-next
without a Fixes tag.

Regression tested only.

