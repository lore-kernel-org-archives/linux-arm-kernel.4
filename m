Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E23606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wg7OZ0XF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sCcmph7DsVZ+M4/rOr7rUY9RqjCf4NgEiNJrwXiX1G4=; b=Wg7OZ0XFZNKHqUfMgSVXpz28S5
	qqcx6acFPup8O1YBcq7AqQYYeEI69EGB/IvzfUzUke3jS5GV0RhFHpWSOohuqZIqeIHdIlgnhoeo5
	WVhAoIQ4DmVGlxeHfcY6ppkMLh4FXJUo7mU5Al5DtS4HaKahDZxGBnfWwDYK99qbX8ZUPqHK3isSW
	QXZh2Ds0A0emS1PfJrVIPA9jtTp3ZuEvJqruIj0B/OpLw7IeWYL2WCQEqesj3DCF/cysSlencv4O5
	+GCbekcncX4NKzEjREmtuChYvJGmlsacpoRdCYrm85bdeiSxz8PPPFQOz72wTf+ur+oamn/88GrJn
	VkdTR3MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWQe-000000046DC-1vVZ;
	Mon, 23 Nov 2026 15:58:04 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWQY-00000004692-19a8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:58:01 +0000
EX-QQ-RecipientCnt: 9
X-QQ-GoodBg: 2
X-QQ-SSF: 0040000000000040
X-QQ-FEAT: D4aqtcRDiqR26Oe/CSwYgjnUOB89n66tA1F463cUJ94=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: zS/bBO3V7TuhYORe4Qa7/fJlBCEhi5StWsQW4zXoiOs=
X-QQ-STYLE: 
X-QQ-mid: v3sz3b-12t1795449412t0614b44b
From: "=?utf-8?B?6buE5Y2O5oiQ?=" <1112433017@e.gzhu.edu.cn>
To: "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>
Cc: "=?utf-8?B?Y2F0YWxpbi5tYXJpbmFz?=" <catalin.marinas@arm.com>, "=?utf-8?B?d2lsbA==?=" <will@kernel.org>, "=?utf-8?B?bWFyay5ydXRsYW5k?=" <mark.rutland@arm.com>, "=?utf-8?B?YnJvb25pZQ==?=" <broonie@kernel.org>, "=?utf-8?B?c3phYm9sY3MubmFneQ==?=" <szabolcs.nagy@arm.com>, "=?utf-8?B?eXVyeS5raHJ1c3RhbGV2?=" <yury.khrustalev@arm.com>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?c3RhYmxl?=" <stable@vger.kernel.org>
Subject: [PATCH 1/1] arm64: gcs: bind signal GCS restore to the live GCSPR_EL0
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Mon, 23 Nov 2026 23:56:52 +0800
X-Priority: 3
Message-ID: <tencent_122AB752205D1FCC2B359940@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-BIZMAIL-ID: 18265133681736249429
X-Address-Ticket: version=;type=;ticket_id=;id_list=;display_name=;session_id=;
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Mon, 23 Nov 2026 23:56:53 +0800 (CST)
Feedback-ID: v:e.gzhu.edu.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NFNrK8KlcSCRgJz9qYrUdA9xxvRHqvDz63B8ZPvBmyHjLqd5DhxWTJOq
	DXg6XcVFSgc08uJ+IXJvDNZcUdY7cMm/EQzl0UzrQEpp2HCincjJ/VCzRHo65gPVaofN+eB
	Jb7xtFUjoEcsywAJvSPmHmcH/RN1RXfmSh9a3PRMO4nqAgeQ2n+z2djMvSU6p1BsMPriyDM
	GeOKFpVIADPK2u9iP8vhOBE3qkEvw4ZEi2uMlfugUMWkeF24PnfcAhmIXU9e30LzbV6wu85
	fjMMVdd4PLkYHr3BRhtBSA/dfO1e1bOV8vvWeAzsp88FXWxrFUR/kCSKpo1TcFl3YSTMIw/
	9EMBT7xgxW4DbNwyhYnE69p/F6H5BInYMChcp+h4I2R4Gr+iF4WOU9nA8H5fhrqZ6WClQmc
	g9MhDF+wVsl9b3V+lGq/sVBvUT4h5IyXOWqjfRBk/suTqVZtzoU01sZ7goNSbV6slcYbmaz
	ZS71REltDDa9LaPo5+pZgC1gU672L+5Unyr2taTA5VHyjtv7+zA6jChokRGsxt5zx2+Qjnz
	i36X78C5sm+lNFH1XulbL+ShyJHmSO1uEYar7nOxWmcANXq6HcILMHC0jYK44SXkiA6zhYJ
	j5n3OxmnU3IunhhK7T/vmFeJNPOCaQnXIGQPj97Ly1dGJXdjrPPEJmSZk6hZWjcjthUjRFV
	0ZXhOApz0HEKL/HFSvgpCqEHRVPm/6kMHsfRenCJt0SbvNo8cFLsR3c/ZQkRFYEWgBzmz6k
	A0jUlA+b1wekSJ6MsH0hItUsbNbO00e9VnWWqkV6FFiEWCYN1LYbV+Rhe/KNq6K0wxGmzOv
	SjD1rZKIZKfSIytPZgSuHV+L1+Hf+PIiUcJCO0nVq5SXkOt/RDtuNLsJZ7t/ri4zrtbr/v+
	QW8lg1XHQO9WbZWUJP5iZqlVY3SrK99FrH4jkkz81SqYUrtjV/h114SUufUs+VxIe7ue3ho
	AmNlsgh6MojU/T33eo0HlV54B7AUv0h+dzCD/TWC75n8Kww==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_075758_876336_4021921B 
X-CRM114-Status: GOOD (  15.70  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8sDQpyZXN0b3JlX2djc19jb250ZXh0KCkgY29waWVzIGdjc3ByIGZyb20gdGhlIHVz
ZXIgc2lnbmFsIGZyYW1lIGludG8gR0NTUFJfRUwwIHdpdGggbm8gcmVzdHJpY3Rpb24gKCJX
ZSBsZXQgdXNlcnNwYWNlIHNldCBHQ1NQUl9FTDAgdG8gYW55dGhpbmcgaGVyZSwgd2Ugd2ls
bCB2YWxpZGF0ZSBsYXRlciIpLCBhbmQgZ2NzX3Jlc3RvcmVfc2lnbmFsKCkgdmFsaWRhdGVz
IG9ubHkgdGhlIHNlbGYtcmVmZXJlbnRpYWwgY2FwIHZhbHVlIGF0IHRoYXQgYWRkcmVzcy4g
IEEgc3RpbGwtbGl2ZSBjYXAgZnJvbSBhbm90aGVyIHNpZ25hbCBjb250ZXh0IHNhdGlzZmll
cyB0aGUgY2hlY2sgYnkNCmNvbnN0cnVjdGlvbiwgc28gYSBjb3JydXB0ZWQgc2lnZnJhbWUg
Y2FuIG1ha2UgdGhlIGtlcm5lbCBjb25zdW1lIGFuIG91dGVyIGNvbnRleHQncyBjYXAgYW5k
IHJld2luZCBHQ1NQUl9FTDAgdG8gYW4gYXR0YWNrZXItY2hvc2VuIGhpc3RvcmljYWwgcG9z
aXRpb24gLSBhZnRlciB3aGljaCByZXR1cm5zIHZhbGlkYXRlIGFnYWluc3QgdGhlIHJld291
bmQgZGVwdGggaW5zdGVhZCBvZiB0aGUgcmVhbCBvbmUsIHR1cm5pbmcgYSBjb250YWluZWQg
bWVtb3J5LWNvcnJ1cHRpb24gcHJpbWl0aXZlIGludG8gYSBiYWNrd2FyZC1DRkkgYnlwYXNz
LiAgV2UgZGVtb25zdHJhdGVkIHRoZSBmdWxsIGNoYWluIChzdGFsZS1jYXAgY3Jvc3MtY29u
dGV4dCByZXBsYXksIHJld2luZCwgcHJvdGVjdGVkLWFjdGlvbiByZXQgYWNjZXB0ZWQgYXQg
dGhlIHJld291bmQgZGVwdGgpIGRldGVybWluaXN0aWNhbGx5IG9uIFFFTVUgVENHIEZFQVRf
R0NTLg0KDQpCaW5kIHRoZSByZXN0b3JlIHRvIHRoZSBsaXZlLCBrZXJuZWwtdmlzaWJsZSBH
Q1NQUl9FTDA6IGZvciBldmVyeSBsZWdpdGltYXRlIHJlc3RvcmUgYXQgZXZlcnkgbmVzdGlu
ZyBkZXB0aCB0aGUgaW5uZXJtb3N0IGZyYW1lJ3MgZ2NzcHIgZXF1YWxzIHRoZSBsaXZlIEdD
U1BSX0VMMCAodGhlIGhhbmRsZXIncyByZXR1cm4gcG9wcyBpdHMgdHJhbXBvbGluZSByZWNv
cmQgYmVmb3JlIHJ0X3NpZ3JldHVybikuICBVc2Vyc3BhY2UgY2Fubm90IG1vdmUgdGhlIGxp
dmUgR0NTUFJfRUwwIHdpdGhvdXQgZXhlY3V0aW5nIEdDUyBpbnN0cnVjdGlvbnMsIHdoaWNo
IGFyZSB0aGVtc2VsdmVzIGNoZWNrZWQuDQoNCmdsaWJjIGNvbXBhdGliaWxpdHk6IHRoZSBH
Q1Mgc2VyaWVzJyBzZXRqbXAvbG9uZ2ptcCB1bndpbmRzIHZpYSBHQ1NQT1BNIGluIHVzZXJz
cGFjZSBhbmQgbmV2ZXIgZGVwZW5kcyBvbiBhIHJlbGF4ZWQgc2lncmV0dXJuOyBHQ1NQT1BN
IGNhbm5vdCBjcm9zcyBhIHNpZ25hbCBjYXAsIHNvIHRoZSBrZXJuZWwgcGF0aCBib3VuZCBo
ZXJlIGlzIHRoZSBvbmx5IHNhbmN0aW9uZWQgcmVzdG9yZSBwYXRoIGFuZCBhbGwgaXRzIGxl
Z2l0aW1hdGUgZm9ybXMgc2F0aXNmeSB0aGUgYmluZGluZy4gIFJhdyAobm9uLUdDUy1hd2Fy
ZSkgbG9uZ2ptcC9zZXRjb250ZXh0L3N3YXBjb250ZXh0IGZhaWwgaWRlbnRpY2FsbHkgd2l0
aCBhbmQgd2l0aG91dCB0aGlzIHBhdGNoLg0KDQoNCi0tLQ0KDQpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9rZXJuZWwvc2lnbmFsLmMgYi9hcmNoL2FybTY0L2tlcm5lbC9zaWduYWwuYw0K
LS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvc2lnbmFsLmMNCisrKyBiL2FyY2gvYXJtNjQva2Vy
bmVsL3NpZ25hbC5jDQpAQCAtNzcyLDYgKzc3MiwxNiBAQCBzdGF0aWMgaW50IHJlc3RvcmVf
Z2NzX2NvbnRleHQoc3RydWN0IHVzZXJfY3R4cyAqdXNlcikNCiAJY3VycmVudC0+dGhyZWFk
Lmdjc19lbDBfbW9kZSA9IGVuYWJsZWQ7DQoNCisJLyoNCisJICogQmluZCB0aGUgZnJhbWUn
cyBnY3NwciB0byB0aGUgbGl2ZSwga2VybmVsLXZpc2libGUgR0NTUFJfRUwwLg0KKwkgKiBG
b3IgZXZlcnkgbGVnaXRpbWF0ZSByZXN0b3JlIChhbnkgbmVzdGluZyBkZXB0aCkgdGhlIGlu
bmVybW9zdA0KKwkgKiBmcmFtZSdzIGdjc3ByIGVxdWFscyBsaXZlIEdDU1BSX0VMMDsgYSBt
aXNtYXRjaCBtZWFucyB0aGUgZnJhbWUNCisJICogaXMgcG9pbnRpbmcgdGhlIHJlc3RvcmUg
YXQgYW5vdGhlciBjb250ZXh0J3Mgc3RpbGwtbGl2ZSBjYXAgLQ0KKwkgKiBhIGNyb3NzLWNv
bnRleHQgc3RhbGUtY2FwIHJlcGxheSB0aGF0IHdvdWxkIHJld2luZCBHQ1NQUl9FTDAgdG8N
CisJICogYW4gYXR0YWNrZXItY2hvc2VuIGhpc3RvcmljYWwgcG9zaXRpb24uDQorCSAqLw0K
KwlpZiAoZ2NzcHIgIT0gcmVhZF9zeXNyZWdfcyhTWVNfR0NTUFJfRUwwKSkgew0KKwkJcHJf
aW5mb19yYXRlbGltaXRlZCgiJXNbJWRdOiBHQ1MgcmVzdG9yZSBwdHIgdW5ib3VuZDogZnJh
bWU9JXB4IGxpdmU9JXB4XG4iLA0KKwkJCQkgICAgY3VycmVudC0+Y29tbSwgdGFza19waWRf
bnIoY3VycmVudCksDQorCQkJCSAgICAodm9pZCAqKWdjc3ByLA0KKwkJCQkgICAgKHZvaWQg
KilyZWFkX3N5c3JlZ19zKFNZU19HQ1NQUl9FTDApKTsNCisJCXJldHVybiAtRUlOVkFMOw0K
Kwl9DQorDQogCQ0KLS0NCg0KVGhhbmvvvIE=


