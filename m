Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A31606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xPNKnKwz;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Aks+70oq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rhhgs3SOKWlfwatuwxS7aRDVfjVPDbWLqI/UBAGOHnE=; b=xPNKnKwzQnU7KT
	Ysxq2fcDtf/lSR388WaXb9do1WpxiSraXf5Z9K5p/tubPQBVfdGAC7Imi/K7DooRscc1q5yt8lqHs
	T2kz9t5fw/DYMdnSpSgpy9FzQZsxyGuqaiC0EWDF3Wsr9+MxAEFK1IaE7i1NUBp/PvXyDnlVNmXrh
	UlvfxbgCI7amEa9daHHgYCYtGTPkZaoUx21ZhvJV4rs3EggDi7vdwibQh37OxukuxC3/NciRI+OGz
	Fv4PZa2vQs6o2hyCnOwMYqW8A0aS1+7v80yrWRqalA9QQFWDiDoQRy6bsy2UXo1AIFccj+3yynTxv
	7ewYN1pbGzOY0yFJmiqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR98Q-00000006vfb-3dnt;
	Wed, 11 Nov 2026 14:17:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR98O-00000006vel-0VNX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:17:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF00A1576;
	Wed, 11 Nov 2026 06:17:03 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAFBC3F632;
	Wed, 11 Nov 2026 06:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794406626; bh=tT/KoO/QdKIgG6YIe8GqMisCkeUut2m9Zpo7qT+ZkAY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Aks+70oqj5nGSTTUzaQusoPGxfXAt6zjVCn/VlBAfLLe48wlQToWbbbfQuR4KhtdH
	 CGRglsv9NvJxgj3OY6wKcTU3iG2fBrGtt8wITDWsRplJ9MAAjdDKlUGZlvAtrw7yWF
	 PtbUTAiE6T1XMBpmVx7spKUO0VqR5EPUkYM/c184=
Message-ID: <89544da0-7c18-4fe5-8005-131760a2b8b5@arm.com>
Date: Wed, 11 Nov 2026 14:17:02 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: mps2-uart: Remove the ports_idr entry when probe
 fails
To: Changyul Lee <lcy8047@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, arnd@kernel.org
Cc: Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla
 <sudeep.holla@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261106010611.1708587-1-lcy8047@gmail.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261106010611.1708587-1-lcy8047@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_061708_251091_D7574C44 
X-CRM114-Status: GOOD (  27.98  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/6/26 01:06, Changyul Lee wrote:
> mps2_of_get_port() adds mps_port to ports_idr, but mps2_serial_probe()
> does not remove the entry when mps2_init_port() or uart_add_one_port()
> fails. mps_port is allocated with devm_kzalloc(), so devres frees it
> when probe fails, while ports_idr still points to it. When another port
> later registers the console, mps2_uart_console_setup() looks up the
> console index in ports_idr and uses the freed mps_port:
> 
>   BUG: KASAN: slab-use-after-free in uart_set_options+0x650/0x7a4
>   Read of size 8 at addr ffff0000018c41a0 by task swapper/0/1
>   Call trace:
>    uart_set_options
>    mps2_uart_console_setup
>    try_enable_preferred_console
>    register_console
>    serial_core_register_port
>    serial_ctrl_register_port
>    uart_add_one_port
>    mps2_serial_probe
>   ...
>   Freed by task 1:
>    kfree
>    dr_node_free
>    devres_release_all
>    device_unbind_cleanup
>    really_probe
> 
> The stale entry also keeps the ID in use. A re-probe of the port (e.g.
> after -EPROBE_DEFER) then gets a different ID than its alias.
> 
> Remove the entry on both error paths.
> 
> Fixes: 9f25e07b882b ("serial: mps2-uart: move to dynamic port allocation")
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>
> ---
> 
> Notes:
>     Found with a static analysis tool we are developing.
>     
>     Reproduced in QEMU (arm64 virt, CONFIG_COMPILE_TEST, KASAN) with two
>     arm,mps2-uart nodes added to the device tree: serial0 without a
>     "clocks" property, so devm_clk_get() fails after the ID is allocated,
>     and serial1 with a fixed clock, booted with console=ttyMPS0. Without
>     this patch KASAN reports the use-after-free above. With it, there is no
>     KASAN report and the boot goes on until it looks for a root filesystem
>     (the test has none).
>     Not tested on MPS2 hardware.

Before getting into the review, I'd like to clarify a few things:

- This driver is only used on a NOMMU platform, where any code
  can write to any memory location, so the security impact of
  this issue is likely minimal

- The only platform that uses this driver is deprecated and
  scheduled for removal [1], with the driver to be removed
  afterwards

@Arnd, could you please advise on how to proceed? Should we
review the patch, leave things as they are, or take a different
approach?

[1] https://lore.kernel.org/linux-arm-kernel/20260908152808.3928630-12-arnd@kernel.org/

> 
>  drivers/tty/serial/mps2-uart.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/mps2-uart.c b/drivers/tty/serial/mps2-uart.c
> index 2a4c09f3a834..c39aa534b822 100644
> --- a/drivers/tty/serial/mps2-uart.c
> +++ b/drivers/tty/serial/mps2-uart.c
> @@ -590,15 +590,19 @@ static int mps2_serial_probe(struct platform_device *pdev)
>  
>  	ret = mps2_init_port(pdev, mps_port);
>  	if (ret)
> -		return ret;
> +		goto err_remove_id;
>  
>  	ret = uart_add_one_port(&mps2_uart_driver, &mps_port->port);
>  	if (ret)
> -		return ret;
> +		goto err_remove_id;
>  
>  	platform_set_drvdata(pdev, mps_port);
>  
>  	return 0;
> +
> +err_remove_id:
> +	idr_remove(&ports_idr, mps_port->port.line);
> +	return ret;
>  }
>  
>  #ifdef CONFIG_OF
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 2.43.0
> 


