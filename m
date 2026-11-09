Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB8F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 21:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KzQ+Ib5G;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JMuVRsUF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1H7zaCpieKBLh84LxvwJhxxRE643HHbqTw00oHfOz4M=; b=KzQ+Ib5GQFBmAAjkl6+74ycDfH
	rQDsh4c4Nqlo1sTokakYsN15miVnSk5h0DauinlJg9H/J7RA4KkViR34Y8N1vkFqYeMHBP1xK/IFc
	qq6yuwd/UeBWbhHuFTCht3AgXiF6sJneCSdRfaIIKH80g51T0GS3lIq0l25j7+jVTjJhUWRS0ETl2
	RsQudf8L9o3HyCilMQ2/A178mq8ojU0gzlp9fhrRv+/EXeFtOEQEzrxIh5nyAAONuLUTqcrSf6PlG
	yrzNekFVJ/uWMzMtktm/BObDmv5pbIe9qLyfGUGX2rrjuK0ONgPtwH7IBeAjP2kAgBQHKBmRszRlg
	0lCpwRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWdF-00000001jgC-3F5W;
	Mon, 09 Nov 2026 21:10:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWd6-00000001jfb-0JrE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 21:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794258613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1H7zaCpieKBLh84LxvwJhxxRE643HHbqTw00oHfOz4M=;
	b=JMuVRsUFNk9cuIX+zwtr3SP238wHdc6lW0O0zI+JHWiFPxYy/JLIkooU12IGJqP9iPmvdD
	nejnXcenJ2TEG/QOtg7JBigtGQVw9ivQLRJbcO1MzGbR0SUQPsY/86fcPpgnBMgUB30/Ta
	MWKAIQggif9ICAhuHo6AE6TIK1ruXZk=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-BbmUAxnBPliPRhBJ8W9Fvg-1; Mon, 09 Nov 2026 16:10:11 -0500
X-MC-Unique: BbmUAxnBPliPRhBJ8W9Fvg-1
X-Mimecast-MFC-AGG-ID: BbmUAxnBPliPRhBJ8W9Fvg_1794258611
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b35b88aa94so20083647b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 13:10:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794258611; x=1794863411;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1H7zaCpieKBLh84LxvwJhxxRE643HHbqTw00oHfOz4M=;
        b=Vrpn+0WrOC09/LVND+VHzbXCXWd0YAhFhmQOW7+vEXu53kA/Pm6LOyy/ETm1EM54A/
         bl0eGod5ogp9KMk5Jcyo6BK68Em9QxCdhLc0mtbMlZ412OKVOOnjQ9r4T47DCVR2Vk7A
         MLZnmF1Uyii9EUJxhbAa0nrHEbHFG6VYaIx5D8LnA/MBqKLycvLVRIlOhfVY2fkem0+R
         03op4cFzZczkUi+G6Ewwm53st50QgachZT1tJFplTfy1WpTe4O846t9QDB5/64gy6HC+
         N4QFw7scIMxVZFRJ7k1jor00x7r01InPfifatCdzfx0J7qhOSPojHY4STOBghK3btqgM
         fvNQ==
X-Forwarded-Encrypted: i=1; AL+hErGHrj7hpH1ARPMUqVDLTaDpqiKaIMpkSJ3G0ooGmN1DIIs4d+ku1NL6brLTwrVHsGtRuyYrLvg5eFAH6w2ZfQN7@lists.infradead.org
X-Gm-Message-State: APuU4Z9EeYFR1FSAmlB98v/UjPY4RFAyhgRAqMs4tYg8+EWJ8z+6spcT
	fBkSbsFELOdsGEGrM6dwROkVUbM6vL5ORiUB/PHYquRa3TT668QC5Ylz3uU2lWJNJtCbcmElOwX
	HufziSFg/XhCT3Ydy5N+dZ1kr3oHCbeTd1dqUNMsB2dQ2oOBoaXuB+O2kg0mhH8llsUOP1bxxGW
	Pg
X-Gm-Gg: AYBFou1AQSt7543Hwfhzpce23Nw0Dcqi2WGAqBIwbc87hy9qKd0got5Fc+ZQcJZ3FHG
	zDb1wFuX2VUCOSCVrFy1pjThZDGl1jOMvT+Ypl9JmhqzgYsmLy/1Xm1EBn7WiW+w+qlTD2cTcRO
	ytTOfm5DrTc14WW39jkGx84x898eiok1Y0MHSMIaZvFqYQJ8yHvRrrF9i6zl80jhr4wFlrDPG6Y
	PdzbC7b74H/XojJ6xkQl2q8SbzNpcOHlFmjw0TVJ8DEnCxFzU5mkMczxDGN7Z5541gqBm1yi+zJ
	RVoHjpwDYsbyN+EB/lD6LdUmju5ydEr1i02cbAIB9/40e5Dq+U62NDTtogsOKIV7eWV7Er5zQkg
	Dj3c8dk5pkhAgD7cLlROHSYVmdOuaiMIUcGlLl7WNAkFlU+FGHFUFyVLlRDBc3KxvOxk6n1pP1d
	dS
X-Received: by 2002:a05:690c:ec6:b0:8b3:361f:5d7a with SMTP id 00721157ae682-8b392aa0a33mr3430017b3.41.1794258611088;
        Mon, 09 Nov 2026 13:10:11 -0800 (PST)
X-Received: by 2002:a05:690c:ec6:b0:8b3:361f:5d7a with SMTP id 00721157ae682-8b392aa0a33mr3429887b3.41.1794258610682;
        Mon, 09 Nov 2026 13:10:10 -0800 (PST)
Received: from redhat.com ([2600:381:e227:64a:814:7bae:8aaa:cea9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393421a3esm3583157b3.32.2026.11.09.13.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:10:07 -0800 (PST)
Date: Mon, 9 Nov 2026 16:10:05 -0500
From: Brian Masney <bmasney@redhat.com>
To: Mark Brown <broonie@kernel.org>, Peng Fan <peng.fan@nxp.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] spi: convert to subsys_platform_driver()
Message-ID: <avI2rf-04L3FOfSv@redhat.com>
References: <20261106-spi-subsys-v1-0-a51a08f21cf2@redhat.com>
 <e86963ef-6080-4aa2-ac80-e06d16d9b092@sirena.org.uk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <e86963ef-6080-4aa2-ac80-e06d16d9b092@sirena.org.uk>
User-Agent: Mutt/2.4.3 (2026-10-09)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ddFYgAvuFk0nzXTlRNasYUQM_sKvGm4YLWTQJdG0U2U_1794258611
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_131016_186620_2C901E63 
X-CRM114-Status: GOOD (  14.45  )
X-Spam-Score: -2.8 (--)
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

Hi Mark,

On Mon, Nov 09, 2026 at 07:14:33PM +0000, Mark Brown wrote:
> On Fri, Nov 06, 2026 at 07:33:07PM -0500, Brian Masney wrote:
> > Reduce boilerplate code in these drivers and convert them over to use
> > the macro subsys_platform_driver().
> 
> This doesn't apply against current code, please check and resend.

I see that Peng Fan already beat me to this! There's nothing else to add
from my series, so there will be no follow up from me.

Peng: Just a heads up that I posted patches across the tree Friday for
this migrated. I think I changed everything that can be easily migrated.
I suspect we may have collided in other subsystems.

Brian


