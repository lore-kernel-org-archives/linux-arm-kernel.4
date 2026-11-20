Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD9E60A380F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 05:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WdumGqFM;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=npnk2DhE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sbd//bs2bSiS9ya3onVON/g2DIspX3vWG1ebZrilzPw=; b=WdumGqFMVDr3Te
	jGuVRWhxEMUVh4Iacap7yvPep+OFbeIu+3cp3gXsKHAHei1GEMKQySWJ+SOGrZ0tLYejzq3zxXYwB
	3uU2F+gprk2jwODrm2KSg+/PrEB1mxGNQJGF/tPP3TN7g/paOSnJP11wqrAAu6XK6EsNr3lmQxm5y
	e1+SP8uYM0Oz/qQZFrDUVqsmEc7S0okqJp1gCVx0c55i20dCEanUMdzmM/m9juAdw6dA31/bfrM8p
	KISM+V2qhLh42oPDApfEcNThp6SNvXDNj1KtF32O+d59tl0xzXzaXr2eolemN8Y6G8/CUcSLxbVn8
	orK82A41Wqqdtj9egB+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHdR-0000000E7SF-3UPv;
	Fri, 20 Nov 2026 05:58:09 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHdO-0000000E7QR-3kjJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 05:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=sbd//bs2bSiS9ya3onVON/g2DIspX3vWG1ebZrilzPw=; b=n
	pnk2DhEj723ZvWEkcKFx1JOlRBaA2uA/ex+0YxEcLhHRyR2+ackC0KB1+pPXxFaA
	v0otHyFjkrUX5/MJRjZmXcaS4cDZ/VuGURgFTIIb4jkaZcccYMTMjZt0/rcmaS1a
	TGpmslZS2mQxQXIU6mhw8+/+VlTtGHHQ5fAfbqXDcA=
Received: from haoxiang_li2024$163.com (
 [240e:604:311:b4ab:8f9f:ca5d:948e:2fcd] ) by ajax-webmail-wmsvr-40-129
 (Coremail) ; Fri, 20 Nov 2026 13:56:55 +0800 (CST)
Date: Fri, 20 Nov 2026 13:56:55 +0800 (CST)
From: "Haoxiang Li" <haoxiang_li2024@163.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "jgross@suse.com" <jgross@suse.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"bp@alien8.de" <bp@alien8.de>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"Ostrovsky, Boris" <boris.ostrovsky@oracle.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"david.vrabel@citrix.com" <david.vrabel@citrix.com>,
	"hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
	"linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/grant-table: fix resource leak in gnttab_init()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <6e3ed5bd9de1764058a257dca9e8fd6ca9fa1175.camel@intel.com>
References: <20261117084325.1241735-1-haoxiang_li2024@163.com>
 <6e3ed5bd9de1764058a257dca9e8fd6ca9fa1175.camel@intel.com>
X-NTES-SC: AL_Qu2SB/2eu0oq4yiRY+kfmUwSj+s8WsO0vf4i245fO5B+jADp1Soae3ppF1/T886DEg+AkSSGUQdHzsB0fqBWdZwGNOdTQvvnJBFy826TJLKPNw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <78fc4539.482c.1a1f78783e1.Coremail.haoxiang_li2024@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: gSgvCgD3Fyko4f9qWLBxAA--.133W
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7ggdi2r-4SjBkgAA3-
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_215807_372149_19DD518A 
X-CRM114-Status: UNSURE (   5.37  )
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

CgpBdCAyMDI2LTExLTIwIDA3OjE4OjAzLCAiRWRnZWNvbWJlLCBSaWNrIFAiIDxyaWNrLnAuZWRn
ZWNvbWJlQGludGVsLmNvbT4gd3JvdGU6Cj4KPklmIHRoZSBQViBndWVzdCBoaXRzIHRoaXMgc2Nl
bmFyaW8gY2FuIGl0IHN1cnZpdmU/IEkgZG9uJ3Qga25vdyB4ZW4gcHYgdmVyeQo+d2VsbC4gRG9l
cyB0aGlzIG1lYW5zIHRoYXQgdGhlIFBWIGd1ZXN0IGhhcyBubyBkaXNrIG9yIG5ldHdvcmsuIElm
IHNvLCB0aGUgdXNlcgo+aXMgcHJvYmFibHkgbm90IGNvbmNlcm5lZCB3aXRoIGEgb25lIHRpbWUg
bWVtb3J5IGxlYWsuCgpUaGFua3MgZm9yIHJhaXNpbmcgdGhpcy4gSSB0ZXN0ZWQgYW4geDg2LTY0
IFBWIERvbTAgdW5kZXIgWGVuIDQuMTcuNyBpbiBRRU1VLAp1c2luZyBhdGFfcGlpeCBmb3Igc3Rv
cmFnZSBhbmQgZTEwMDAgZm9yIG5ldHdvcmtpbmcuCgpJIGluamVjdGVkIC1FTk9NRU0gaW1tZWRp
YXRlbHkgYmVmb3JlIHRoZSBpbml0aWFsIE1GTi1hcnJheSBhbGxvY2F0aW9uIGluCmdudHRhYl9t
YXAoKSwgYWZ0ZXIgYXJjaF9nbnR0YWJfaW5pdCgpIGhhZCBzdWNjZWVkZWQuIFdpdGggYW5kIHdp
dGhvdXQgdGhlCnBhdGNoLCBnbnR0YWJfaW5pdCgpIHJldHVybmVkIC1FTk9ERVYsIGJ1dCBEb20w
IHN0aWxsIGJvb3RlZCB0byB1c2Vyc3BhY2UuCkluIGJvdGggY2FzZXMsIGRpc2sgSS9PIHdvcmtl
ZCwgYW5kIHRoZSBuZXR3b3JrIGludGVyZmFjZSBjb3VsZCByZWFjaCB0aGUKUUVNVSBnYXRld2F5
LgoKSG93ZXZlciwgSSBhZ3JlZSB0aGF0IHRoaXMgaXMgYSBvbmUtdGltZSBsZWFrIHdpdGggbGlt
aXRlZCBpbXBhY3QuIEkgaGF2ZSBub3QKZGVtb25zdHJhdGVkIGFueSBmdXJ0aGVyIHVzZXItdmlz
aWJsZSBjb25zZXF1ZW5jZXMgZnJvbSB0aGUgbGVhay4KClJlZ2FyZHMsCkhhb3hpYW5nIExpCgoK
Cg==

