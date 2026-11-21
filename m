Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3069B606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 06:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sbffkLP0;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ML9A+ras
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=k5BKq+xslui1xiJuqhlDdIUc8BouYoKQVy88v5Nuwjk=; b=sbffkLP0mbYIaJ
	slalE1SP0QNPuvNyDy34XZvI0EuKPEvb2gJywZoeORILte6s73OR2IfiYp9C0KYPTjlMVYN8h12GQ
	JPj+JGex4lEk7DrpJaGeH2w1nd5xPWNfi48Q3ixkX+ObBAxxWhyBKCHaJkYC8oPMRdsabFBQDD10e
	fTrZGe5QwpThGQX3eFSdmGy3URtI1c7wE8IMCHeLVm7hIHygsZ2EO3Qsrlrjx1XGWk3BHG9lPyNQk
	lBSPJGzLTiUFc49Z2fwNTlBxw9t5wYhz7SkeHhMBSyPNvmLGgjoPrKFUYcufrWtlZYrnFn5MC3f7l
	1Z7oTzYAhuleh1K8rb/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUenV-0000000GoTX-2fD7;
	Sat, 21 Nov 2026 06:42:05 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUenS-0000000GoSU-3IWv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 06:42:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=k5BKq+xslui1xiJuqhlDdIUc8BouYoKQVy88v5Nuwjk=; b=M
	L9A+rasjEd09mRq4I+ha2qCnc4a4TFNHzYt7WNniPk9Eq0fXLlOhmKiAzbGhGEwU
	oObqNvLpFxB0zO7ja5ZPKhEwR/yyrPVs3JLodx2QAGZeGIAtZxNfpWVqpoxJYdyn
	fwtUOyBNVmILMM6tUrugIQzW91h6KIMhFSzeQb7E9w=
Date: Sat, 21 Nov 2026 14:40:51 +0800 (CST)
From: "Haoxiang Li" <haoxiang_li2024@163.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Ostrovsky, Boris" <boris.ostrovsky@oracle.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"david.vrabel@citrix.com" <david.vrabel@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "bp@alien8.de" <bp@alien8.de>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"jgross@suse.com" <jgross@suse.com>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH] xen/grant-table: fix resource leak in gnttab_init()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <ceade382ab685f63b90b5bda405363db01f486e7.camel@intel.com>
References: <20261117084325.1241735-1-haoxiang_li2024@163.com>
 <6e3ed5bd9de1764058a257dca9e8fd6ca9fa1175.camel@intel.com>
 <78fc4539.482c.1a1f78783e1.Coremail.haoxiang_li2024@163.com>
 <ceade382ab685f63b90b5bda405363db01f486e7.camel@intel.com>
X-NTES-SC: AL_Qu2SB/6fvEou5ymYbOkfmUwSj+s8WsO0vf4i245fO5B+jDjp1T4OT1F4NHjp+uW9ICG1iDO4agVRzeJlcaxVXYswkxcUb8ZW/LSkWCV2SnAgaQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <57e13adb.164a.1a1fcd618cf.Coremail.haoxiang_li2024@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: bygvCgD3v6H0PAFryAVzAA--.60W
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7RRn1WsBPPS5OwAA3r
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_224203_240809_A33525A2 
X-CRM114-Status: UNSURE (   4.82  )
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

CkF0IDIwMjYtMTEtMjEgMDY6MDY6NTgsICJFZGdlY29tYmUsIFJpY2sgUCIgPHJpY2sucC5lZGdl
Y29tYmVAaW50ZWwuY29tPiB3cm90ZToKPgo+SSBndWVzcyBzaW5jZSB5b3UgaW5qZWN0ZWQgdGhl
IGVycm9yIHlvdSBkaWRuJ3QgaGl0IHRoaXMgaW4gcHJhY3RpY2U/IElmIHNvLCBJJ2QKPnRoaW5r
IHRoaXMgd291bGQgYmUgYSBwcmV0dHkgbG93IHByaW9yaXR5IGZpeC4gVGhlIGNvbWJvIG9mIHJh
cmUgc2NlbmFyaW8gYW5kCj5jbG9zZSB0byB6ZXJvIHVzZXIgaW1wYWN0LiBGaW5lIHRvIGJlIGNv
cnJlY3RlZCB0aG91Z2guCgpJIGFncmVlIHRoYXQgdGhpcyBmYWlsdXJlIGlzIHVubGlrZWx5IHRv
IGhhcHBlbi4gSSBmb3VuZCB0aGUgbWlzc2luZyBjbGVhbnVwIHVzaW5nIGEKc3RhdGljIGFuYWx5
c2lzIHRvb2wgYW5kIGNoZWNrIHRoZSBsZWFrIHdpdGggZmF1bHQgaW5qZWN0aW9uLiBCdXQgaGFy
ZCB0byBwcm92ZQp0aGF0IGl0IHdpbGwgaGFwcGVuIGluIG5vcm1hbCB1c2Vyc3BhY2UuCgpSZWdh
cmRzLApIYW94aWFuZyBMaQ==

