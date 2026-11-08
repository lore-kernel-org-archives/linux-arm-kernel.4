Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72288606D83B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 17:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BAYC5JpJ;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=FFYQAXc1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:References:In-Reply-To:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NmyEWJc1Ic7Z/rksgvIEk89eDaTsRIbN9HNjuWwu8cA=; b=BAYC5JpJ4B/zUwGxqVQH1gRf2i
	izhdeMYZl72iSN439NvHTd/x/hltFAxCUXgGgcs7/uZf5P65URFzaghUp6mtl0V6WTSoz3OK/rAN4
	EDhze+SAp6fKHERsTm+oyhgsOaQ1mMowiOSv+JhgKPYQTYEg7j7NArQbq0qfTJqjDHQVFhwaAJ6GM
	K/ktscppNSCVS47xxvnJ3WjxYzbmqwt+Wb6MkRsaIIsgL/v389DHOCGi+mhFK7CetjyX1xMZv9dtr
	r+NXV3rPmcWJWh1CJqU2/BY13ie5xZNHcLYHMewe68GPEdhlrLp/bWwYHKWvP3dGtpLEUe3jpdrYz
	xKszkY8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ6d0-0000000GQln-3HHd;
	Sun, 08 Nov 2026 17:24:26 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ6ct-0000000GQjF-1taX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 17:24:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794158653; bh=NmyEWJc1Ic7Z/rksgvIEk89eDaTsRIbN9HNjuWwu8cA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=FFYQAXc1xWyQuIB8eNGgGZFRoX5FVVTGO/y40V3IEqfHmD2995JverP+VZ+9ns7m9
	 DAmzshq8bAi0d9wShpzOrUFqTt2EkRnPNHDDZjOsormulSp+WWZOsSg3uexDhewceX
	 y8+fOBUETQkhjpwCjJNfYuAS14DYu9HfBoTmteyQ=
Received: from [127.0.1.1] ([5.195.0.150])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 5F906C5D; Mon, 09 Nov 2026 01:23:57 +0800
X-QQ-mid: xmsmtpt1794158651t44il0cdn
Message-ID: <tencent_8AA2EA5638DD0246FDAA553AD6E31759410A@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznPs19ki3w231F8oYPXsRSoFBm+zE6AJTP782SOyUS7n++LFzCih
	 NZFiATXOwMZ2XKgUIgs8aM95A0UE9BIKjaC1HQ53Qo+IiTdh8SPn6XVX5jMl4n8K6BjjDAI2O3Tv
	 F23Nlircw7FAKRQ1EsoibqMHhnz0NbGMBintRwebUYlQdiL04IlDRf5AQHvWsA/n9NtY5/+Fo1MP
	 JDLlO7eVfHh1EmBKLHbuh0yH/j4fdmQwP8nZg99EXHGYAH+QZ8+fqVy2VNzER8HvAB7ggbPUCE+K
	 CxeWkK8Ib+y57VJT6TPXJIDlnbYvYJEdqmKcsFd+yBon6ud+W/3lwt/GChqoHzJuBPo0UqVkb1S9
	 TCqW7I3ulc3PyrodtSz1RUxy4yTJGuRgM3RSD/p+4vBKbDrcSydynZ88+4DhbECDp8JbbhvZLMKZ
	 ikJyxZO1bgqcZLPg7a22Kptd080qH/0Exm8+HoioVHuSg+lHH2oL8XcWTOvYbUvKls8woq0+4/Fr
	 w0h6ODcVTjCga2/hObCwaj2G2Key/DoUmJpBwOwhsUiY0RFqKfAJebcfBqhXTBRDYoRqIZfN+XI8
	 +L2QDb6+VLAzCaX0vIqdOa/PxWt36Zj+JePWM2eDpxONy8uJl1M3tPlVk7iDcUIrV0fvyMUuE3BI
	 Gxjmc5oSdyI5e6GeHsB6Eal8dbE2hjiG0AJqdvp/LF957fI7FZ+vPH3J008+IuqpF08s+nw7XD7y
	 1Zv/cY0wP44AWuM6XPs1fDzW/9fETUA6wOyi76b5dvWbmotdaH0PtPgy/8n0VQDDxBMXIgWn/jQ/
	 Y+jEmodRCFLUTEXlIsaVcZpceEYMv8LC8Sa3uW7s0ku02UFe/cLgMYo03gG++nPkE3vSTloa9Qo2
	 r/aL+fMT/c4ojJ5h6blioZm7dm37nsSPq9kYlA1/Jweweb9rSW7eg3cYtxtLsQ/eeoGPM2FSeTqR
	 Vj1V7J81iM3mnhYLbLUmwsjBrmenJs+JMImCC2Oeu1yWgPp76AoLCBR5wJjYlD8WPgl6dwH//GBL
	 v4hOJufPox5T48dsWT4SSqq03aogLTm0NLsd7eBH98mu1aNqSBA6ohIwhbDfUWlhZsf9tT3yC0Xx
	 0vS0yO
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Jiawen Liu <1298662399@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: atmel-ssc: handle clock enable failure
In-Reply-To: <2026100111-tinwork-unglue-3b65@gregkh>
References: <tencent_95E7173942FAE82639FD03E6FFCE5516D60A@qq.com> <2026100111-tinwork-unglue-3b65@gregkh>
Date: Sun, 08 Nov 2026 21:22:12 +0400
X-OQ-MSGID: <179415853265.5.11620130792194703406@qq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_092419_882280_6D0A41AB 
X-CRM114-Status: UNSURE (   6.36  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Greg,

Thanks for catching this. The Signed-off-by name should match the From line;
I'll use my full name, Jiawen Liu.

I'll recheck the patch against the current tree and the recipient list before
preparing an update.

Thanks,
Jiawen


