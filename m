Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41803606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oCNE/YIw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=tKvkIX/q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vpOeS1zLysQBqy4y0tcCfJ4mFvl/Hm26T1odAFXU41I=; b=oCNE/YIwmfZjIYz18jh6pdgwsQ
	zpQC9Z46HIPhtiDzKqPG9QmKHbn2vAPtMUpVaqP4hdTJLQZZU+uWOICEsILHIgy4b10mf6EFO9aBA
	fsjWr3kbNi27B/z3BnBjTXoMikVJKx9snpmaPyVFAuwj+AI55kkODbqwC5L4KIV6gRpCPIyMEz8D/
	7ubU869heVrLOUW7DP55DqNUvD/H7SQ+jmksMff8QLsac+WJiXzoVmC9hpdZq9AseNhCmpuYBr2MW
	3lOaRUWg0pTaOUFGrLxX/bB+Rhz+XK4hCg/xEI4Orcrezc9d2j0Llp+cJSXeu28Mh2YlwqG3eKgF8
	lqwRePNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxDr-0000000GcOy-3YV1;
	Fri, 27 Nov 2026 14:46:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxDp-0000000GcOM-2A4A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vpOeS1zLysQBqy4y0tcCfJ4mFvl/Hm26T1odAFXU41I=; b=tKvkIX/qsR5EQqZ3xxnvhOkD+k
	/nkpp39lr0Wjt9OKV2nxffpt6gNnSxZU4YS8fyCXgBLDIRwfn4RhdrkMoFQBfdQqpcnBcbT1R88vT
	CbNyxDFx/SffB5N+cjbshjruiXTHCI8ux9FOn50wFXzHX/93uA15JxE4BC2InTABEiOc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWxDm-001oS0-Dn; Fri, 27 Nov 2026 15:46:42 +0100
Date: Fri, 27 Nov 2026 15:46:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: zhaofeng2@cmss.chinamobile.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: dove: fix OF node leak in dove_init_pmu()
Message-ID: <0c93419e-11d4-473a-a01b-689e7c33ab3e@lunn.ch>
References: <20261127074219.1188-1-zhaofeng2@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127074219.1188-1-zhaofeng2@cmss.chinamobile.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_064645_549474_E1BBFCB7 
X-CRM114-Status: GOOD (  10.55  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> @@ -451,5 +454,7 @@
>  			pr_err("dove_init_pmu_irq() failed: %d\n", ret);
>  	}
>  
> -	return 0;
> -}
> +	of_node_put(domains_node);
> +
> +	return 0;
> +}

The logic of the change looks O.K. But this hunk looks odd. I would
expect it to be:

+
+	of_node_put(domains_node);
+
 	return 0;
 }

i.e. insert the put. Why did it replace the return 0;. Is there a
space/tab issue here?

	  Andrew

