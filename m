Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85275606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 06:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xV5xMsC3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2W57r7YcujbrCZFzHR5EJ6NOsw7Wouekt8Bj3sjTC+k=; b=xV5xMsC3Jj8Z9i
	k306IGzvpugF2H+yFBVUQaVGy+8bAvWw9C1hQeG0AxagchHFmRiIMNYET9JFQVJICKLlHAjEJYTau
	vE7nfylEVPD6HW8ZfNe/pxF+0f5r8G8YNoSzZ9FgGxsc/IfzT2y/y12+/dBbJTGXuDTrdXziLfCAy
	P9QAOEboXN83a3mfIkL6LZq7wnWMaNOt46nZmGswitcOclUtkxdvyZ0aiqBFY+zmEuGevGX4tsDwe
	SqcIfir/j7CMLOaaE+f6MAvIYFXWCDikJl6U8vmAwU04EQs4tbWKwGpelpLgu+yYgPukAW/yUMB8I
	iFqIR5buJwS/IfO57yUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPa58-0000000EHLR-3W87;
	Sat, 07 Nov 2026 06:39:18 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPa56-0000000EHKs-2m4u
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 06:39:18 +0000
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowACHIbeQx+5qgxiAAA--.354S2;
	Sat, 07 Nov 2026 14:39:12 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Sinan Kaya <okaya@kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 vulab@iscas.ac.cn
Subject: Re: [PATCH v2] dmaengine: qcom_hidma: Fix runtime PM leak in
 hidma_issue_task()
Date: Sat, 07 Nov 2026 06:15:00 +0000
Message-ID: <20261107061500.314159-1-vulab@iscas.ac.cn>
In-Reply-To: <au4I5haNWglFazT3@SMW015318>
References: <179395457228.2120679.13809646473624751961@iscas.ac.cn>
 <au4I5haNWglFazT3@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowACHIbeQx+5qgxiAAA--.354S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYW7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
	W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Gr43Wr1UJr1l4c8EcI
	0Ec7CjxVAaw2AFwI0_Jw0_GFyl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUr7KsUUUU
	U
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwIEA2rucYKNrgABsX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_223917_248677_52FA1869 
X-CRM114-Status: UNSURE (   5.43  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I am sorry for the late reply. I am a real person, not a bot. The silence
was because I had fallen behind on my review backlog.

I understand why it may look that way, but I would ask you to hold off on
marking these patches until I have cleared the backlog. I am going through
the pending review comments now and will reply to every open thread within
the next two days. I would be grateful for the chance to show that this
account is properly maintained.

Sorry again for the delay.


